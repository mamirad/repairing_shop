class CreateReferSources < ActiveRecord::Migration[5.2]
  def change
    create_table :refer_sources do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :city
      t.string :address

      t.timestamps
    end
  end
end
