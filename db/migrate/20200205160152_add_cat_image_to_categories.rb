class AddCatImageToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :catimage, :string
  end
end
