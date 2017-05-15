class UsersController < ApplicationController
#before_filter :authenticate_user!

  def show
    @user2 = User.find(params[:id])
    
    respond_to do |format|
        format.html # show.html.erb
    end
  end

  def rate
    @user2 = User.find(params[:user])

    if @user2.average_rating.blank?
      @user2.update_attribute(:average_rating, 0)
    end
    if @user2.total_rating.blank?
      @user2.update_attribute(:total_rating, 0)
    end
    
    avg = ((@user2.average_rating*@user2.total_rating) + params[:ratingPoints].to_i)/(@user2.total_rating+1)

    @user2.update_attribute(:total_rating, @user2.total_rating+1)
    @user2.update_attribute(:average_rating, avg)

    respond_to do |format|
      msg = { :status => "ok", :average_rating => "%.2f" % @user2.average_rating, :rating_number => @user2.total_rating.to_i}
      format.json  { render :json => msg } 
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