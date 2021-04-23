class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string      :name,  null: false 
      t.integer     :shelf_life, null: false
      t.integer     :frozen_life, null: false
      t.string      :info
      t.references  :category, foreign_key: true
      t.timestamps
    end
  end
end