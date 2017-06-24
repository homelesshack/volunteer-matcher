class CreateCharities < ActiveRecord::Migration[5.1]
  def change
    create_table :charities do |t|
      t.string :name, null: false
      t.string :postcode, null: false

      t.timestamps
    end
  end
end
