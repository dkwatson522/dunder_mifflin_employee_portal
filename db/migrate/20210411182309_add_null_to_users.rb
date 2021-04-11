class AddNullToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:users, :email, false)
    change_column_null(:users, :created_at, false)
    change_column_null(:users, :updated_at, false)
  end
end
