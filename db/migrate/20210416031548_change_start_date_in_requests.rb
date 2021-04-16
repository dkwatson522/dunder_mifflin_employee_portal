class ChangeStartDateInRequests < ActiveRecord::Migration[6.1]
  def up
    change_column :requests, :start_date, :string
    change_column :requests, :end_date, :string
  end

  def down
    change_column :requests, :start_date, :datetime
    change_column :requests, :end_date, :datetime
  end
end
