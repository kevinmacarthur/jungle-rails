class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_product,
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
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

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
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
