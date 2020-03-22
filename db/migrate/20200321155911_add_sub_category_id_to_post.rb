class AddSubCategoryIdToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :sub_category_id, :integer
  end
end
