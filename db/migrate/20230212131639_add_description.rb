class AddDescription < ActiveRecord::Migration[7.0]
  def change

    add_column :accounts , :bio ,:string
    add_column :accounts , :username ,:string
  end
end
