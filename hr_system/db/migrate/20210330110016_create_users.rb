class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :role
      t.string :department
      t.integer :paid_time_off
      t.integer :salary
      t.integer :experience
    end
  end
end
