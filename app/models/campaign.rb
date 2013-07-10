class Campaign < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::TextHelper

  attr_accessible :topic_id, :image_url, :video_url, :funding_deadline, :stance 
  attr_accessible :short_blurb, :location, :cause_url, :funding_goal, :pitch, :title
  attr_accessible :tag_list, :donation_total, :opposing_campaign_id, :status

  validates_presence_of :title, :short_blurb, :location, :image_url

  has_many :campaign_users
  has_many	:users, through: :campaign_users
  belongs_to :topic

  acts_as_taggable

  [PENDING, ACTIVE, FUNDED, SUSPENDED, UNSUCCESSFUL].each do |stat|
    define_method "#{stat.downcase}?" do
      self.status == stat
    end
  end

  def separated_time_ago
    seconds = self.funding_deadline - Time.zone.now
    if seconds > 0
      if seconds / 86400 > 1
        result = { 'day' => (seconds / 86400).to_i }
      elsif seconds % 3600
        result = { 'hour' => (seconds / 3600).to_i }
      else
        result = { 'minute' => (seconds / 60).to_i }
      end
      pluralized = pluralize(result.values.first, result.keys.first) 
      return pluralized.split(' ')
    else
      return ["Campaign funded", ""]
    end
  end

  def before_deadline?
    self.funding_deadline > Date.today
  end

  def display_deadline
    self.funding_deadline.strftime("Funding Deadline: %m/%d/%Y")
  end

  def display_countdown
    self.funding_deadline.strftime("%B%e, %Y %H:%M:%S")
  end

  def campaign_matchers
    Matcher.joins(:campaign_user => :campaign).where("campaigns.id =?", self.id)
  end

  def supporters
    CampaignUser.campaign_supporters(self.id)
  end

  def

  def update_funding_status
    self.status = FUNDED if self.donation_total >= self.funding_goal
    self.save
  end

  class << self
    def active_campaigns
      self.where(status: PENDING)
    end

  end



end
