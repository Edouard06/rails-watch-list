class ListsController < ApplicationController
    before_action :find_list, only: [:show, :edit, :update, :destroy]
    before_action :new_list_form, only: [:new]

    def index
      @lists = List.all
    end

    def show
      @movies = @list.movies
    end

    def new
      @list = List.new
    end

    def create
      @list = List.new(list_params)

      if @list.save
        redirect_to list_path(@list)
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @list.update(list_params)
        redirect_to lists_path(@list)
      else
        render :edit
      end
    end

    def destroy
      @list.destroy
      redirect_to lists_path, status: :see_other
    end

    private

    def list_params
      params.require(:list).permit(:name, :details) # Assure-toi d'ajouter tous les champs requis ici
    end

    def find_list
      @list = List.find(params[:id])
    end

    def new_list_form
      @hide_completed = true
    end
  end
