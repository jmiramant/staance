class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @campaigns = Campaign.where(topic_id: params[:id])
  end
end
