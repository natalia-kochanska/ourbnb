class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:edit, :update, :new, :create, :destroy]


  def index
    Listing.import
    if params[:search].present?
      @listings = Listing.search(params[:search]).records
    else
      @listings = Listing.all.order('created_at DESC')
    end
     
  end

  def new
    @listing = Listing.new #empty object
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render 'new' # same as render :new
    end
  end

  def edit
  end

  def update
    @listing.update(listing_params)
    # if @listing.save
      redirect_to my_listings_path(current_user)
    # else
    #   render 'edit'
    # end        
  end

  def delete
    @listing = Listing.find(params[:listing_id])  
  end 

  def destroy 
      @listing.destroy
      redirect_to my_listings_path(current_user)
  end

  def my_listings #'get '/users/:id/listings' do
    @listings = current_user.listings.order('created_at DESC')
  end
  
  def show
    @listing = Listing.find(params[:id])

  end


  private
  def listing_params
    params.require(:listing).permit(:name, :address, :description, :property_type, :number_of_beds, :price, {avatars:[]}, :tag_list)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end 

end
