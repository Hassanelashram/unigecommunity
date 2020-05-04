class AddsubChildCategoryToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :child_category_parent_id, :integer
  end
end
