class AddChildCateogryIdToCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :child_category_parent_id, :integer
  end
end
