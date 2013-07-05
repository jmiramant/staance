class ScheduledWorker
  include Sidekiq::Worker
  sidekiq_options retry: false


  def perform(campaign_id)
    campaign = Campaign.find(campaign_id)
    if campaign.status == 'Funded'
      send_donations(campaign)
      p 'im funded'
    else
      campaign.status = "Unsuccessful"
      campaign.save
      p "not successful"
    end    
  end

  def send_donations(campaign)
    p "sending donations"
    donations = collect_donations(campaign)
    donations.each do |donation|
      charge = Stripe::Charge.create(
        customer: donation[0].stripe_id,
        amount:   donation[1],
        description: campaign.title,
        currency: 'usd'
        )
    end
  end

  def collect_donations(campaign)
    donations = []
    campaign_users = campaign.campaign_users.where(user_type: "Donator")
    campaign_users.each do |cuser|
      donations << [cuser.find(cuser.user_id), cuser.donation_amount]
    end
    p donations
  end
end
