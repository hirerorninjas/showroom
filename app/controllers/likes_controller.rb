class LikesController < ApplicationController
  def index
  	@user = current_user
  	@products = Product.all
  end
  def create
    # Grab our book from the DB. Note that this syntax is for Rails 3.2 and below. Rails 4 uses something called Strong Parameters, but that is for another time. 
    product = Product.find(params[:product_id])
    # Create a like
    Like.create(:product_id => product.id, :user_id => current_user.id)
    # redirect back to the Like index page and assign a flash
    redirect_to likes_path, :notice => "You just liked the book #{book.title}" 
  end

  def destroy
    # Get the like form the DB
    like = Like.find(params[:id])
    # destroy it
    like.destroy
    redirect_to likes_path, :notice => "You destroyed a like"
  end

  

end
