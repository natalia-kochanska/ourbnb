class HardWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform(reservation)
  	
  
  end
end