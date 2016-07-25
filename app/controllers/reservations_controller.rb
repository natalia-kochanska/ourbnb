class ReservationsController < ApplicationController
	

  def index
  	@reservations = Reservation.where(user_id: current_user).order('checkin ASC')
  end

  def new
    @listing = Listing.find(params[:listing_id])
  	@reservation = Reservation.new
    
  end

  def create
    @listing = Listing.find(params[:listing_id])
  	@reservation = @listing.reservations.new(reservation_params)
    @reservation.user_id = current_user.id
  	if @reservation.save
      flash[:success] = "Reservation has been made. You can check it below."
  		redirect_to listing_reservations_path(@listing)
	  else 
	  	render :new
	  end
  end

  def show
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:warning] = "Reservation has been cancelled"
    redirect_to user_reservations_path(current_user)
  end

  private

  def reservation_params
      params.require(:reservation).permit(:checkin, :nights)
  end
end
