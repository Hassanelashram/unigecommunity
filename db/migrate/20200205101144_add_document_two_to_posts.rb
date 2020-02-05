class AddDocumentTwoToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :document_two, :string
  end
end
