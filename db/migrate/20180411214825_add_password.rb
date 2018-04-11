class AddPassword < ActiveRecord::Migration
  def change
    add_column :developers, :password_digest, :string
  end
end
