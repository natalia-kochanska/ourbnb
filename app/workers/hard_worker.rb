class HardWorker
  include Sidekiq::Worker

  def perform(reservation)
  	@reservation = reservation
    ReservationMailer.reservation_email(@reservation.user, @reservation.listing.user, @reservation.listing.id).deliver_now
  end
end