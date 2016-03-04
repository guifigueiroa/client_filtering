class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.string :filter_name
      t.integer :age_to
      t.integer :age_from
      t.string :op_state
      t.string :state
      t.string :op_role
      t.string :role

      t.timestamps null: false
    end
  end
end
