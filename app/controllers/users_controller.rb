class UsersController < ApplicationController
#before_filter :authenticate_user!

  def show
    @user2 = User.find(params[:id])
    
    respond_to do |format|
        format.html # show.html.erb
    end
  end

  def update
  	@user2 = User.find(current_user)
  	respond_to do |format|
	    if @user2.update(user_params)
	      format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
	      format.json { respond_with_bip(@user2) }
	    else
	      format.html { render :action => "edit" }
	      format.json { respond_with_bip(@user2) }
	    end
    end
  end

  def user_params
    accessible = [:email,:username, :location, :name, :birthday, :description, :contact_number, :password, :password_confirmation, :remember_me] # extend with your own params
    params.require(:user).permit(accessible)
  end
end