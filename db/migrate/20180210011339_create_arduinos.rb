class CreateArduinos < ActiveRecord::Migration[5.1]
  def change
    create_table :arduinos do |t|
      t.string :ip
      t.string :nome
      t.integer :equipamento_id

      t.timestamps
    end
  end
end
