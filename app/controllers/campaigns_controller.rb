class CampaignsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def new
    @campaign = Campaign.new
  end

  def create
  end

  def destroy
  end

  def show
  end

  def update
  end

end
