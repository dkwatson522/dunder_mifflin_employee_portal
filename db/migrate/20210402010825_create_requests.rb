class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.float :number_of_hours
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
