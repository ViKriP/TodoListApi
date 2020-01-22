class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.datetime :deadline
      t.integer :position
      t.boolean :completed, default: false, null: false
      t.belongs_to :project, foreign_key: true

      t.timestamps
    end
  end
end
