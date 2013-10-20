class UserMailer < ActionMailer::Base
  
  default from: "info@edildo.me"
  def send_dildoaccess(email, userdetail)
  	@userdetail = userdetail
  	@user_url = userdetail_url(@userdetail, :host => "edildo.me") + "?passcode=" + @userdetail.passcode.to_s
  	mail(:to => email, :subject => "Edildo link from " + @userdetail.firstname)
  end

end
