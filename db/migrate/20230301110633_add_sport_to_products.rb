class AddSportToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :sport, :string
  end
end
