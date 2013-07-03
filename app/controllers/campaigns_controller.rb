class CampaignsController < ApplicationController

  def index
    @topics = Topic.all
  end

end
