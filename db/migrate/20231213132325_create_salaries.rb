class CreateSalaries < ActiveRecord::Migration[6.1]
  def change
    create_table :salaries do |t|
      t.integer     :base_amount
      t.integer     :bonus_amount
      t.integer     :status, default: 0
      t.references  :user, null: false

      t.timestamps
    end
  end
end
