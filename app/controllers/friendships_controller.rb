class FriendshipsController < ApplicationController
  def create
    friend=User.find(params[:friend])
    current_user.friendships.build(friend_id:friend.id)
    if current_user.save
      flash[:notice]="Successfully Follow the friend"
      redirect_to my_friend_path
    else
      flash[:notice]="There is Something Wrong"
      redirect_to my_friend_path
    end
  end

  def destroy
    friendship=current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    flash[:notice]="Successfully Unfriend"
    redirect_to my_friend_path

  end
end
