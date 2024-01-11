class BookmarksController < ApplicationController

def index
  @bookmarks = Bookmark.all
end

def show
  @bookmark = Bookmark.find(params[:id])
end

def new
  @list = List.find(params[:list_id])
  @bookmark = Bookmark.new
end

def create
  @bookmark = Bookmark.new(bookmark_params)
 if  @bookmark.save
  redirect_to root_path(@bookmark)
 else
  render :new
 end
end

def destroy
  @bookmark = Bookmark.find(params[:id])
  @bookmark.destroy
  redirect_to bookmarks_path, notice: "Bookmark was successfully destroyed"
end

end
