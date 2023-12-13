class RemoveSalaryFromUserTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :salary, :integer
  end
end
