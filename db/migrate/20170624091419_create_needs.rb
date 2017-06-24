class CreateNeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :needs do |t|
      t.string :skill, null: false
      t.decimal :time_amount, null: false
      t.references :charity, foreign_key: true, null: false, index: true
      t.string :days, array: true, null: false, default: []

      t.timestamps
    end
  end
end
