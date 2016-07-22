class UsersController < ApplicationController
  def index
		@listings = Listing.order("created_at DESC").all.page(params[:page]).per(5)

	end
	
	def create
		@user = User.last.id
		redirect_to "/users/#{@user}"
	end

	def show
		@user = User.find(params[:id])
		
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
  		if @user.update(user_params)
  			redirect_to user_path
  		else
  			render 'edit'
  		end        
	end

	private
	 def user_params
      params.require(:user).permit(:name, :surname, :password, :about, {avatars:[]})
    end
end
