class AddMoreStuffToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :birthday, :date
  	add_column :users, :description, :string
  	add_column :users, :contact_number, :string
  end
end
