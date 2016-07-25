class ApplicationMailer < ActionMailer::Base
  default from: "reservarion@ourbnb.com"
  
  def reservation_email(customer, host, reservation_id)
  	@reservarion.user = customer
  	@listing.user = host
  	@reservation.id = reservation_id
  end
end
