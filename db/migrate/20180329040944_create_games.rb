class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :developer
      t.string :description
      t.string :genre
      t.float :price
    end
  end
end
