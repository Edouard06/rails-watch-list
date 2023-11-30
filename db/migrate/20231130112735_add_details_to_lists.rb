class AddDetailsToLists < ActiveRecord::Migration[7.1]
  def change
    add_column :lists, :details, :text
  end
end
