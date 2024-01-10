class BookmarksController < ApplicationController

def index
  @bookmarks = Bookmark.all
end

  def new
  @bookmark = Bookmark.new
end

def create
  @bookmark = Bookmark.new(bookmark_params)
  @bookmark.save
  redirect_to bookmark_path(@bookmark)
end

def destroy
  @bookmark = Bookmark.find(params[:id])
  @bookmark.destroy
  redirect_to bookmarks_path, notice: "Bookmark was successfully destroyed"
end

end
