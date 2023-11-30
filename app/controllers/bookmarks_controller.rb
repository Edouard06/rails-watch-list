class BookmarksController < ApplicationController
    before_action :find_bookmark, only: [:show, :edit, :update, :destroy]
    before_action :new_bookmark_form, only: [:new]

    def index
      @bookmarks = Bookmark.all
    end

    def show
      # Utilisation de before_action pour trouver la tâche
    end

    def new
      @list = List.find(params[:list_id])
      @bookmark = @list.bookmarks.new
    end
    def create
      @list = List.find(params[:list_id])
      @bookmark = @list.bookmarks.new(bookmark_params)

      if @bookmark.save
        redirect_to list_path(@list), notice: 'Bookmark was successfully created.'
      else
        render :new
      end
    end

    def edit
      # Utilisation de before_action pour trouver la tâche
    end

    def update
      if @bookmark.update(bookmark_params)
        redirect_to bookmarks_path(@bookmark.list)
      else
        render :edit
      end
    end
    def destroy
      @bookmark = Bookmark.find(params[:id])
      @bookmark.destroy
      redirect_to list_path(@bookmark.list), status: :see_other
    end

    private

    def bookmark_params
      params.require(:bookmark).permit(:comment, :movie_id)
    end


    def find_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    def new_bookmark_form
      @hide_completed = true # Utilise cette variable pour masquer le champ "Terminée" dans le formulaire new
    end
  end
