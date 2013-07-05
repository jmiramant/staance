module TaggingHelper
  def trending
    trending_camps = Campaign.where(updated_at: Date.today())
    
  end
end
