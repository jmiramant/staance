class CampaignsController < ApplicationController

def index
  @topics = Topic.all
end

def new
end

def create
  campaign = Campaign.new(args)
  CampaignUser.new
  campaign.usersrai.user_id = user.id
  campaign.user_type = "Creator"
  campaign.topic = params[:topic]
  campaign.save
end

def destroy
end

def show
end

def update
end

end
