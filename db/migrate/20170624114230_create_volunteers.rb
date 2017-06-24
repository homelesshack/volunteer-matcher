class CreateVolunteers < ActiveRecord::Migration[5.1]
  def change
    create_table :volunteers do |t|
      t.string :name, null: false
      t.decimal :hours_per_week, null: false
      t.string :days_available, array: true, default: [], null: false
      t.string :skills, array: true, default: [], null: false
      t.string :postcode, null: false
      t.decimal :miles_from, null: false, default: 5
      t.boolean :dbs_checked, default: false, null: false

      t.timestamps
    end

    add_index :volunteers, :postcode
    add_index :charities, :postcode
    add_index :needs, :days, using: 'gin'
    add_index :volunteers, :days_available, using: 'gin'
    add_index :volunteers, :skills, using: 'gin'
  end
end
