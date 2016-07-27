class PaymentsController < ApplicationController
	# before_action :authenticate_user!

  def new
    @client_token = Braintree::ClientToken.generate
    @reservation = Reservation.find(params[:reservation_id])
    @payment = Payment.new
  end

  def create
  	@reservation = Reservation.find(params[:reservation_id])
    @result = Braintree::Transaction.sale(
      amount: @reservation.price,
      payment_method_nonce: params[:payment_method_nonce]
    )

    if @result.success?  
      transaction_id = @result.transaction.id
      @reservation.payments.create(transaction_id: transaction_id, reservation_id: params[:id])
      flash[:success] = "Successful payment"
      redirect_to root_path
    else 
      flash[:danger] = "Transaction hasn't been processed"
      redirect_to root_path
    end
  end

end
