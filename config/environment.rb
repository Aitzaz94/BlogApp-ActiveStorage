# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!


# ActionMailer::Base.delivery_method = :smtp
# ActionMailer::Base.perform_deliveries = true
# ActionMailer::Base.smtp_settings = {
#     address:                'smtp.gmail.com',
#     port:                   587,
#     domain:                 'gmail.com',
#     user_name:              'aitzazakmal@gmail.com',
#     Password:               'PWNDHjei7827#*!8x2ksj!!QwR',
#     authentication:         'plain',
#     :ssl                    => true,
#     :tsl                    => true,
#     enable_starttls_auto:   true
# }

# config.action_mailer.delivery_method = :smtp
# config.action_mailer.smtp_settings = {
#     :address              => "smtp.gmail.com",
#     :port                 => 587,
#     :user_name            => '<login>',
#     :password             => '<password>',
#     :authentication       => 'plain',
#     :enable_starttls_auto => true  
# }