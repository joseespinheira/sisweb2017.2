class CreateEquipamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :equipamentos do |t|
      t.string :nome
      t.integer :comando_id

      t.timestamps
    end
  end
end
