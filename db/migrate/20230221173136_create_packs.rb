class CreatePacks < ActiveRecord::Migration[7.0]
  def change
    create_table :packs do |t|
      t.boolean :is_valid
      t.float :remaining_hours
      t.references :type, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
