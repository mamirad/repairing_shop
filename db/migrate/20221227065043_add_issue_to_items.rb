class AddIssueToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :issue, :text
  end
end
