ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "edildo.me",
  :user_name            => "samantha.edildo",
  :password             => "Web@1234",
  :authentication       => "plain",
  :enable_starttls_auto => true
}