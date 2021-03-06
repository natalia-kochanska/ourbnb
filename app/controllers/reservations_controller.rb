class ReservationsController < ApplicationController
	

  def index
  	@reservations = Reservation.where(user_id: current_user).order('checkin ASC').page(params[:page]).per(7)
  end

  def new
    @listing = Listing.find(params[:listing_id])
  	@reservation = Reservation.new
    
  end

  def create
    @listing = Listing.find(params[:listing_id])
  	@reservation = @listing.reservations.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.nights = @reservation.checkout - @reservation.checkin
    @reservation.price = @reservation.listing.price * @reservation.nights
    respond_to do |format|
    	if @reservation.save
        ReservationMailer.delay.reservation_email(@reservation.user, @reservation.listing.user, @reservation.listing.id)
        flash[:success] = "Reservation has been made. You can check it below."
    		format.html { redirect_to listing_reservations_path(@listing) }
        format.json { render :show, status: :created, location: @reservation }
  	  else 
        flash[:danger] = "The reservation hasn't been made. Try choosing different dates."
  	  	format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
  	  end
    end
  end

  def show
    @listing = Listing.find(params[:listing_id])
    @reservations = @listing.reservations.all.order('checkin ASC').page(params[:page]).per(7)
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:warning] = "Reservation has been cancelled"
    redirect_to user_reservations_path(current_user)
  end

  private

  def reservation_params
      params.require(:reservation).permit(:checkin, :checkout)
  end
end
