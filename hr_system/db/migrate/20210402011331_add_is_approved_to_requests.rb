class AddIsApprovedToRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :requests, :is_approved, :boolean
  end
end
