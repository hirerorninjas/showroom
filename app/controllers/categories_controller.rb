class CategoriesController < ApplicationController
  before_filter :set_category, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  def index
    @categories = Category.paginate(page: params[:page], per_page: 3) 
    respond_with(@categories)
  end

  def show
    respond_with(@category)
  end

  def new
    @category = Category.new
    respond_with(@category)
  end

  def edit
  end

  def create
    if current_user.admin?
      @category = Category.new(params[:category])
      @category.save
      respond_with(@category)
    else 
      render :text => '<h2>Sorry,You are not authorised to create the product at this time!</h2>', :status => '404', :layout => true
      #redirect_to action: :index
    end
  end

  def update
    @category.update_attributes(params[:category])
    respond_with(@category)
  end

  def destroy
    @category.destroy
    respond_with(@category)
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end
end
