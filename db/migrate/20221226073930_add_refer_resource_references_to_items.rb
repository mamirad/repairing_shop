class AddReferResourceReferencesToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :refer_source, foreign_key: true, optional: true
  end
end
