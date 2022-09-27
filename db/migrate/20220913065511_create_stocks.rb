class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.string :name
      t.decimal :last_price
      t.string :ticker

      t.timestamps
    end
  end
end
