class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    	t.string 	:name, default: ''
    	t.string	:logo, default: 'logo.png'
    	t.belongs_to :category
      t.timestamps
    end
  end
end
