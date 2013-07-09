module CreateFormValidation
  extend self

  def form_three_validations(campaign)
    errors = ['errors']
    errors << "Cause url cannot be blank" unless !campaign[:cause_url].blank?
    errors << "Funding Deadline cannot be blank" unless !campaign[:funding_deadline].blank?
    errors << "Funding Goal must be greater than 0" unless campaign[:funding_goal].to_i > 0

    if !campaign[:funding_deadline].blank?
      errors << "Funding deadline must be greater than today" unless campaign[:funding_deadline] > Date.today
    end

    errors
  end

end



