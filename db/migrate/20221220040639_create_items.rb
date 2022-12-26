class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :model
      t.string :brand
      t.string :iemi
      t.references :customer, foreign_key: true, null: true

      t.timestamps
    end
  end
end
