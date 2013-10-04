module RegistrationMailerHelper
  def optional_detail(detail, title)
    if(!!detail == detail)
      concat "#{title}: Ja\n" unless detail == false
    else
      concat "#{title}: #{detail}\n" unless detail == nil or detail == ''
    end
  end
end
