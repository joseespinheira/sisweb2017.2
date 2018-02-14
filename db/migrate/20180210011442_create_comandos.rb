class CreateComandos < ActiveRecord::Migration[5.1]
  def change
    create_table :comandos do |t|
      t.string :nome
      t.string :comando

      t.timestamps
    end
  end
end
