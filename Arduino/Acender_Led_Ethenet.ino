#include <SPI.h>
#include <Ethernet.h>

//Definicoes de IP, mascara de rede e gateway
byte mac[] = {
  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };
IPAddress ip(192,168,0,88);          //Define o endereco IP
IPAddress gateway(192,168,0,1);      //Define o gateway
IPAddress subnet(255, 255, 255, 0); //Define a máscara de rede
 
//Inicializa o servidor web na porta 80
EthernetServer server(80);
/*
byte mac[] = { 0x90, 0xA2, 0xDA, 0x0F, 0x09, 0xA7 }; //physical mac address
byte ip[] = { 192, 168, 1, 59 }; // ip in lan 
byte gateway[] = { 192, 168, 1, 1 }; // internet access via router  http://192.168.50.1
//byte dns[] = { 192, 168, 50, 1 };
byte subnet[] = { 255, 255, 255, 0 }; //subnet mask
EthernetServer server(80); //server port
*/
String readString;

int pin = 9; 
boolean ligado = true;

//////////////////////

void setup(){

  pinMode(pin, OUTPUT); //pin selected to control
  //start Ethernet
  Ethernet.begin(mac, ip, gateway, subnet);
  server.begin();
  //the pin for the servo co
  //enable serial data print
  Serial.begin(9600);
  Serial.println("RoboCore Remote Automation V1.1"); // so I can keep track of what is loaded
}

void loop(){
  // Create a client connection
  EthernetClient client = server.available();
  if (client) {
    while (client.connected()) {
      if (client.available()) {
        char c = client.read();

        //read char by char HTTP request
        if (readString.length() < 200) {

          //store characters to string
          readString += c;
          //Serial.print(c);
        }

        //if HTTP request has ended
        if (c == '\n') {

          ///////////////////// control arduino pin
          Serial.println(readString); //print to serial monitor for debuging
          if(readString.indexOf("?listar") >0)//checks for on
          {
            //digitalWrite(pin, HIGH);    // set pin 4 high
            Serial.println("Lista de comandos:");
            Serial.println("?ligar");
            Serial.println("?desligar");
            Serial.println(readString);

            client.println("HTTP/1.1 200 OK"); //send new page
            client.println("Content-Type: text/html");
            client.println();
            client.println("<html>");
            client.println("<head>");
            client.println("<title>- Arduino -</title>");
            client.println("</head>");
            client.println("<body>");
            client.println("<h1>Lista de comandos:</h1>");
            client.println("<ul>");
            client.println("  <li>Ligar</li>");
            client.println("  <li>Desligar</li>");
            client.println("</ul>");
            client.println("</body>");
            client.println("</html>");
            readString="";
          }
          else if(readString.indexOf("?ligar") >0)//checks for on
          {
            digitalWrite(pin, HIGH);    // set pin 4 high
            Serial.println("On");
            ligado = false;
            readString="";
          }
          else{
            if(readString.indexOf("?desligar") >0)//checks for off
            {
              digitalWrite(pin, LOW);    // set pin 4 low
              Serial.println("Off");
              ligado = true;
              readString="";
            }
          }
          
          if(readString=="")
          {
            client.println("HTTP/1.1 200 OK"); //send new page
            client.println("Content-Type: text/html");
            client.println();
            
            client.println("<html>");
            client.println("<head>");
            client.println("<title>- Arduino -</title>");
            client.println("</head>");
            client.println("<body>");
            client.println("<h1>Lampada</h1>");
            client.println("<h1>Lampada</h1>");
            
            ///////////////
            if(!ligado)
            {
              client.println("<h2><a href='/?desligar'>Desligar</a></h2>");
            }
            if(ligado)//ligado true
            {
              client.println("<h2><a href='/?ligar'>Ligar</a></h2>");
            }
            client.println("</body>");
            client.println("</html>");
          }
          //clearing string for next read
          readString="";
          delay(1);
          //stopping client
          client.stop();

        }
      }
    }
  }
}