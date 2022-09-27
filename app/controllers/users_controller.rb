class UsersController < ApplicationController
  def my_portfolio
      @tracked_stock=current_user.stocks
      render 'users/my_portfolio'

  end
  def my_friends
    @friends=current_user.friends
    @friends=current_user.except_current_user(@friends)

  end
  
  def search
    if params[:friend].present?
      @friends=User.search(params[:friend])
      if @friends
        render 'users/my_friends'
      else
        flash[:alert]="Kindly provide some valid keyword:"
        render 'users/my_friends'
      end
    else
      flash[:alert]="Kindly provide some keyword name:"
      render 'users/my_friends'
    end
  end

  def show
    @friend=User.find(params[:id])
    @tracked_stock=@friend.stocks
  end
  
end
