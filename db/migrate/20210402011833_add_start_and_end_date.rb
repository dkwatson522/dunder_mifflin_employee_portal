class AddStartAndEndDate < ActiveRecord::Migration[6.1]
  def change
    add_column :requests, :start_date, :datetime
    add_column :requests, :end_date, :datetime

    change_column_default :requests, :is_approved, from: nil, to: false
  end
end
