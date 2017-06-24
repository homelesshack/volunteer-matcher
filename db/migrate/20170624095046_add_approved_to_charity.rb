class AddApprovedToCharity < ActiveRecord::Migration[5.1]
  def change
    add_column :charities, :approved, :boolean, null: false, default: false
  end
end
