class ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :destroy]
  before_action :set_list, only: [:new, :create]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = @list.reviews.build
  end

  def create
    @review = @list.reviews.build(review_params)
    if @review.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to review_path(@review)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to list_path(@review.list), status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
