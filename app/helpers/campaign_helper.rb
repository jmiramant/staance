module CampaignHelper
  extend self

  def render_objects_for_view(current_user, campaign)
    user_supporter = CampaignUser.where(user_id: current_user.id, campaign_id: campaign.id, user_type: SUPPORTER) if current_user
    support_ids = CampaignUser.where(campaign_id: campaign.id, user_type: SUPPORTER).pluck("user_id")
    donor_ids = CampaignUser.where(campaign_id: campaign.id, user_type: DONOR).pluck("user_id")
    
    campaign_show = {
      user_supported: user_supporter, 
      supporters: support_ids.map { |id| User.find_by_id(id) },
      donors: donor_ids.map { |id| User.find_by_id(id) },
      video: UrlToMediaTag.convert(campaign.video_url, width: 540, height: 320)
    }
  end



end
