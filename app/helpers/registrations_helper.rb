module RegistrationsHelper

  def age_at(dob,at = Time.now)
    now = at.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def gender_color gender
    case gender
      when 1
        safe_concat ' class="male"'
      when 2
        safe_concat ' class="female"'
    end
  end

  def str_study study
    case study
      when 0
        concat "2-Fach Bachelor"
      when 1
        concat "Landschaftsökologie"
      when 2
        concat "Geographie"
      when 3
        concat "Geoinformatik"
    end
  end

  def study_color study
    case study
      when 0
        safe_concat ' class="zfgeo"'
      when 1
        safe_concat ' class="loek"'
      when 2
        safe_concat ' class="geo"'
      when 3
        safe_concat ' class="gi"'
    end
  end

  def yes_no_helper yesno
    case yesno
      when true
        concat "ja"
      when false
        concat "nein"
    end
  end

  def attention_color
    safe_concat ' class="attention"'
  end
end
