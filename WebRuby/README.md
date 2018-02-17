# Site feito em ruby on rails

Para fazer funcionar:

instale:
Ruby
Rails
bundle

- Comando para instalar as dependencias (GEM) no rails
$ bundle install

- Comando para carregar o banco de dados e fazer as migrações e popular a base com exemplos.
$ rake db:create
$ rake db:migrate
$ rake db:seed

- Comando para iniciar o servidor no ip 0.0.0.0 e na porta 8080:
$ rails server -b 0.0.0.0 -p 8080

Apenas o usuario: "admin@admin.com" é aceito como usuario administrativo e a senha é: "123456".


# Projetos futuros:
- implementar controle de usuario administrativos.
- Implementar envio de comando com segurança.
- Melhorar o desiner.