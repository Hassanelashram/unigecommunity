class CreateOpinions < ActiveRecord::Migration[6.0]
  def change
    create_table :opinions do |t|
      t.text :body
      t.integer :user_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
