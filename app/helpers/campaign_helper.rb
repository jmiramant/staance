module CampaignHelper
  extend self

  def render_objects_for_view(current_user, campaign)
    support_ids = campaign.supporters
    donor_ids = campaign.donors
    button_status = (campaign.status == 'Active') ? 'Pause' : 'Activate'
    campaign_show = {
      supporter_count: support_ids.count,
      donor_count: donor_ids.count,
      video: UrlToMediaTag.convert(campaign.video_url, width: 540, height: 320),
      button_status: button_status
    }
  end

  def set_build_session
    session[:campaign_build] = @campaign.id
  end
end
