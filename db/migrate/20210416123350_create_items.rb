class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,          null: false
      t.integer :quantity,     null: false
      t.date :purchase_date,   null: false
      t.date :expiration_date, null: false
      t.text :memo
      t.references :user,      foreign_key: true

      t.timestamps
    end
  end
end