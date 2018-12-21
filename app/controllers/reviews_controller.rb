class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy]
  before_action :set_product,

  def index
    @reviews = Review.all
  end

  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  def create
    @current_user = current_user
    @review = @current_user.reviews.build(review_params)
    @review.product = @product
      if @review.save
        puts "REVIEW HAS BEEN SAVED #{@review}"
        redirect_to product_path(@product)
      else
        puts "SOMETHING Went Wrong"
        p @review.errors
        redirect_to product_path(@product)
      end
  end

  def destroy
    @review.destroy
    redirect_to product_path(@product)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def set_product
      @product = Product.find_by(id: params[:product_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:product_id, :user_id, :description, :rating)
    end
end
