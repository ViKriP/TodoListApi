class ChangeProjectsNameDefault < ActiveRecord::Migration[5.2]
  def self.up
    change_column :projects, :name, :string, null: false
  end
  
  def self.down
    change_column :projects, :name, :string, null: true
  end
end
