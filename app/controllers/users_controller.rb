class UsersController < ApplicationController
  def index
  	@user = User.new
  	@users = User.all
  end

  def create
  	User.create(user_params)
  	redirect_to :back
  end

  def edit
  	@user = User.find params[:id]
  end

  def update
  	if User.find(params[:id]).update_attributes(user_params)
  		redirect_to users_path
  	else
  		redirect_to :back
  	end
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :idnumber)
  end
end
