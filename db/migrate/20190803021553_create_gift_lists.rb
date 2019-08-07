class CreateGiftLists < ActiveRecord::Migration[5.2]
  def change
    create_table :gift_lists do |t|
    	t.belongs_to :user
    	t.string :name, null: false, default: ""
    	t.boolean :done, default: false
      t.timestamps
    end
  end
end
