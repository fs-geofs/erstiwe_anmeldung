module RegistrationsHelper

  def age_at(dob,at = Time.now)
    now = at.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end
