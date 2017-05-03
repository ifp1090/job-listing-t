class AddCategoryNameToJob < ActiveRecord::Migration[5.0]
  def change
  	add_column :jobs, :category_name, :string, 
  end
end
