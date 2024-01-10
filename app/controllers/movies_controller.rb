class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    @movies = [] if @movies.nil?
  end

def show
  @movie = Movie.find(params[:id])
end

def new
  @movie = Movie.new
end

def create
  @movie = Movie.new(movie_params)
  @movie.save
  redirect_to movie_path(@movie), notice: "Movie was successfully created"
end

def edit
  @movie = Movie.find(params[:id])
end

def update
  @movie = Movie.find(params[:id])
  @movie.update(movie_params)
  redirect_to movie_path(@movie), notice: "Movie was successfully updated"
end

def destroy
  @movie = Movie.find(params[:id])
  @movie.destroy
  redirect_to movies_path, notice: "Movie was successfully destroyed"
end

private

def movie_params
  params.require(:movie).permit(:title, :overview, :poster_url, :rating)
end

end
