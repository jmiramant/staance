class CampaignUsersController < ApplicationController
  
  def create
    CampaignUser.create(campaign_id: params[:format], user_id: current_user.id, user_type: "Supporter")
<<<<<<< HEAD
  	render nothing: true
=======
    redirect_to :back
>>>>>>> master
  end
end
