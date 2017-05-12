class UsersController < ApplicationController
#before_filter :authenticate_user!

  def show
    @user2 = User.find(params[:id])
    
    respond_to do |format|
        format.html # show.html.erb
    end
  end
end