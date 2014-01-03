class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @user = current_user

    end
  end

  def help
  end

  def about
    @user = User.new

  end

  def contact
  end

  def payment
  end

  def subscription
    @User = current_user
  end

end