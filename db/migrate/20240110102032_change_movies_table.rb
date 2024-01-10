class ChangeMoviesTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :movies, :description
    add_column :movies, :overview, :text
    add_column :movies, :poster_url, :string
    add_column :movies, :rating, :integer
  end
end
