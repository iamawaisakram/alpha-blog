class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome to the Alpha Blog #{@user.username}"
			redirect_to articles_path
		else
			render 'new'
		end

	end


	def edit
		@user = User.find(params[:id])

	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "Your account was updated successfully"
			redirect_to articles_path
		else
			render 'edit'
		end
	end
	def show
		#@user = User.find(user_params[:id])
		@user = User.find(8)
	end


	private
	def user_params
		#params.fetch(:user).permit(:username, :email, :password)
		params.require(:user).permit(:username, :email, :password)
	end
end