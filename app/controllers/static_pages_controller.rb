class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if signed_in?
    @user = current_user

  end

  def help
  end

  def about
  end

  def contact
  end

  def payment
  end
end