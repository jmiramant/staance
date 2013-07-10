module CampaignHelper
  extend self

  def render_objects_for_view(current_user, campaign)
    # use campaign.supporters method in Campaign model
    support_ids = CampaignUser.where(campaign_id: campaign.id, user_type: SUPPORTER).pluck("user_id")
    # create campaign.donors method in Campaign model
    donor_ids = CampaignUser.where(campaign_id: campaign.id, user_type: DONOR).pluck("user_id")
    
    campaign_show = {
      # should be... supporters: campaign.supporters
      supporters: support_ids.map { |id| User.find_by_id(id) },
      # should be... supporters: campaign.donors
      donors: donor_ids.map { |id| User.find_by_id(id) },
      video: UrlToMediaTag.convert(campaign.video_url, width: 540, height: 320)
    }
  end

  def set_build_session
    session[:campaign_build] = @campaign.id
  end
end
