# frozen_string_literal: true

require 'pony'

class MailerService
  class << self
    def send_notification(report)
      if ENV['USER_NAME'] && ENV['PASS'] && ENV['DESTINATION']
        begin
        Pony.mail to: ENV['DESTINATION'],
                  from: ENV['USER_NAME'],
                  subject: 'CV Notification',
                  body: report,
                  via: :smtp,
                  via_options: {
                    address: 'smtp.gmail.com',
                    port: '587',
                    user_name: ENV['USER_NAME'],
                    password: ENV['PASS'],
                    authentication: :plain
                  }
        puts report
        rescue => e
          logger.error e
        end
      else
        logger.error 'Critical error: No credentials for mailer'
      end
    end
  end
end
