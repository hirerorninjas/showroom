class ProductsController < ApplicationController
  before_filter :set_product, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  def index
    @products = Product.paginate(page: params[:page], per_page: 3) 
     @like_ids = Like.all.collect(&:product_id)
     @product_ids = Product.all.collect(&:id)
    respond_with(@products)
  end

  def show
    respond_with(@product)
  end

  def new
    @product = Product.new
    respond_with(@product)
  end

  def edit
  end

  def create
    if current_user.admin?
      @product = current_user.products.build(params[:product])
      @product.save
      respond_with(@product)
    else 
      render :text => "<h2>Sorry,You are not authorised to create the product at this time!</h2>", :status => '404', :layout => true
      #redirect_to action: :index
    end
  end

  def update
    @product.update_attributes(params[:product])
    respond_with(@product)
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end

  def block_deal
    @block_deal = Product.find(params[:id])
    @block_deal.update_attributes(:deal => 'false')
    respond_with(@block_deal)
  end

  def all_likes
    @deal = Product.find(params[:id])
    if !Like.exists?(product_id: params[:id])
    #@deal = @deal.update_attributes(:deal => 'true')
     @test = Like.create(:user_id => current_user.id, :product_id => params[:id])
     #cookies[:random] ||= rand(10000)
    respond_with(@test)
    end
  end

  def unlike_likes
    @deal = Product.find(params[:id])
    #@deal = @deal.update_attributes(:deal => 'true')
     #@test = Like.create(:user_id => current_user.id, :product_id => params[:id])
     # if Like.exists?(product_id: params[:id])
     @destroy_like = Like.where(:product_id => params[:id].to_i).destroy_all
     #cookies[:random] ||= rand(10000)
    respond_with(@destroy_like)
  #end
end

  private
    def set_product
      @product = Product.find(params[:id])
    end
end




# Amazon EC2
# Heroku
# Rackspace
# Dreamhost
# Windows Azure
# Linode
# Hostgator