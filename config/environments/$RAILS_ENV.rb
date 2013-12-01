config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'http://mysterious-chamber-5155.herokuapp.com',
  user_name:            'jjrturner992@gmail.com',
  password:             '425jelly',
  authentication:       'plain',
  enable_starttls_auto: true  }