class CreateSimDataObjects < ActiveRecord::Migration
  def change
    create_table :sim_data do |t|
      t.string :type
      t.integer :parent_id
      t.json :properties
    end
  end
end
