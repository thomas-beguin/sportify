class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.float :price_per_day
      t.integer :year_of_purchase
      t.string :condition
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
