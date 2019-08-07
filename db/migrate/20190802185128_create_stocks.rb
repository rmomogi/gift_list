class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
    	t.belongs_to :product
    	t.integer 	:quantity
    	t.monetize 	:price
      t.timestamps
    end
  end
end
