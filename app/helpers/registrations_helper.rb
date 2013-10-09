module RegistrationsHelper

  def age_at(dob,at = Time.now)
    now = at.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def gender_color user
    case user.gender 
      when 1 
        safe_concat ' class="male"'
      when 2
        safe_concat ' class="female"'
    end
  end
end
