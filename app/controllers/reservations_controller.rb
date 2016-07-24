class ReservationsController < ApplicationController
	before_action :find_listing, only: [:new, :craete, :delete]

  def index
  	
  end

  def new
  	@reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new
  	@reservation = current_user.reservations.new(lisitng_id: find_listing, checkin: params[:checkinn], nights: params[:nights])
  	if @reservation.save
  		redirect_to listing_reservations_path(@listing)
	else 
	  	render :new
	end
  end

  def show
  end

  def delete
  end

  private

  def find_listing
    @this_listing = Listing.find(params[:listing_id])
  end 
end
