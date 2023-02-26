class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :account, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
    
    #so the user won't be able to like the post twice 
    add_index :likes, [:account_id, :post_id], unique: true
  end
end
