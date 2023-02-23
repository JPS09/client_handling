class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.text :address
      t.string :phone_number

      t.timestamps
    end
  end
end
