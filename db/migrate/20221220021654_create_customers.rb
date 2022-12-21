class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :city
      t.string :address
      t.string :cnic_no

      t.timestamps
    end
  end
end
