class ScheduledWorker
  include Sidekiq::Worker

  def perform(date, campaign_id)
    campaign = Campaign.find(campaign_id)
    if campaign.status == 'Funded'
      send_donations(campaign)
    else
      campaign.status = "Unsuccessful"
    end    
  end

  def send_donations(campaign)
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
    donations
  end
end
