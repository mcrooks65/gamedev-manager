class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.string :games
      t.string :location
      t.integer :employees
    end
  end
end
