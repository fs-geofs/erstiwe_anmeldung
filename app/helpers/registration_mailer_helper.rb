module RegistrationMailerHelper
  def optional_detail(detail, title)
    if(!!detail == detail)
      safe_concat "#{title}: Ja\n" unless detail == false
    else
      safe_concat "#{title}: #{detail}\n" unless detail == nil or detail == ''
    end
  end
end
