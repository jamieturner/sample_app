class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :destroy, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end


  def show

    @user = User.find(params[:id])

    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def index
    @users = User.paginate(page: params[:page])
    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv }
      format.xls
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Tell the UserMailer to send a welcome Email after save
      UserMailer.welcome_email(@user).deliver

      # Subscribe user to list
      gb = Gibbon::API.new("fe6a623db7bd901c4f06991e1ea3ffb9-us5")

      gb.lists.subscribe({:id => "b9839b86d0", :email => {:email => @user.email}, :merge_vars => {:FNAME => @user.name, :LNAME => @user.name}, :double_optin => false})


      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user

    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :avatar, :customer_id)
  end

  # Before filters


  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end