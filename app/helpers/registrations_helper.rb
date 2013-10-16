module RegistrationsHelper

  def age_at(dob,at = Time.now)
    now = at.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def gender_color gender
    case gender
      when 1
        "male"
      when 2
        "female"
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
        "zfgeo"
      when 1
        "loek"
      when 2
        "geo"
      when 3
        "gi"
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

  def attention_color for_what
    case for_what
      when true
        "attention"
    end
  end
end
