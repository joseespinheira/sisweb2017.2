# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Comando.create(nome: "Ligar", comando: "?ligar");
Comando.create(nome: "Desligar", comando: "?desligar");

Equipamento.create(nome:"Lampada", comando_id:"1")
Equipamento.create(nome:"Lampada", comando_id:"2")


#Arduino.create(ip: "192.168.0.888", equipamento_id: "1");
