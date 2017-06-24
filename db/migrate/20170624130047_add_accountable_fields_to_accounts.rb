class AddAccountableFieldsToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :accountable_id, :integer
    add_column :accounts, :accountable_type, :string
    add_index :accounts, [:accountable_id, :accountable_type]
  end
end
