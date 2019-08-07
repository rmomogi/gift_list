class CreateGiftListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :gift_list_items do |t|
    	t.belongs_to 	:gift_list
    	t.belongs_to 	:product
    	t.integer 		:quantity
    	t.monetize 		:price
      t.timestamps
    end
  end
end
