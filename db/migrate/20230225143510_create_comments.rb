class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.string :account_id
      t.string :account_username
      t.string :post_id

      t.timestamps
    end
  end
end
