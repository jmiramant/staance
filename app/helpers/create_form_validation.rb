module CreateFormValidation
  extend self

  def form_three_validations(campaign)
    errors = []
    errors << "Cause url cannot be blank" if campaign[:cause_url].blank?
    errors << "Funding Deadline cannot be blank" if campaign[:funding_deadline].blank?
    errors << "Funding Goal must be greater than 0" unless campaign[:funding_goal].to_i > 0

    unless campaign[:funding_deadline].blank?
      begin
        errors << "Funding deadline must be greater than today" unless campaign[:funding_deadline].to_date > Date.today
      rescue
        campaign[:funding_deadline] = DateTime.strptime(campaign[:funding_deadline], "%m/%d/%Y")
        form_three_validations(campaign)
      end
    end
    errors
  end

end



