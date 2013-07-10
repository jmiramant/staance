class ScheduledWorker
  include Sidekiq::Worker
  sidekiq_options retry: false


  def perform(campaign_id)
    campaign = Campaign.find(campaign_id)
    if campaign.status == FUNDED
      send_donations(campaign)
    else
      campaign.status = UNSUCCESSFUL
      campaign.save
    end    
  end

  def send_donations(campaign)
    donations = collect_donations(campaign)
    donations.each do |donation|
      charge = Stripe::Charge.create(
        customer: donation[0].stripe_id,
        amount:   donation[1]*100.to_i, #multiply by 100 to convert to cents
        description: campaign.title,
        currency: 'usd'
        )
    end
  end

  def collect_donations(campaign)
    donations = []
    campaign_users = campaign.campaign_users.where(user_type: DONOR)
    campaign_users.each do |cuser|
      cuser
      donations << [User.find(cuser.user_id), cuser.donation_amount]
    end
    donations
  end
end
