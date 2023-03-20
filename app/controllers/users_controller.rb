class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
     redirect_to user_path(@user.id)
    else
     render :edit
    end
  end

  def create
   @user = User.new(@user.id)
   if @user.save
    flash[:notice] = "Welcome! You have signed up successfully."
     redirect_to user_path
   else
     render :new
   end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
