class CreateSimDataObjects < ActiveRecord::Migration
  def change
    create_table :sim_objects do |t|
      t.string :type
      t.integer :parent_id
      t.json :properties
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
