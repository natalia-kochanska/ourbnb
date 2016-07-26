class ApplicationMailer < ActionMailer::Base
  default from: "reservarion@ourbnb.com"
  
  def reservation_email(customer, host, listing)
  	@customer = customer
  	@host = host  	
  	@listing = listing
  	mail(to: @host.email, subject: 'New reservation for your listing')
  end
end
