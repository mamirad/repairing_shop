class CreateCustomerItems < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_items do |t|
      t.references :customer, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :status
      t.text :issue_details
      t.references :refer_source, foreign_key: true, null: true

      t.timestamps
    end
  end
end
