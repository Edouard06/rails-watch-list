class AddForeignKeysToBookmarks < ActiveRecord::Migration[6.0]
  def change
    change_table :bookmarks do |t|
      t.references :movie, foreign_key: true
      t.references :list, foreign_key: true
    end
  end
end
