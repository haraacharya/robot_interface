ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "edildo.me",
  :user_name            => "xxxxxxxxxxxxxxx",
  :password             => "xxxxxxxx",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
