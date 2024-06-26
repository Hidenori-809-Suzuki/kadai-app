class CreateImageposts < ActiveRecord::Migration[7.1]
  def change
    create_table :imageposts do |t|
      t.text :title
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :imageposts, [:user_id, :created_at]
  end
end
