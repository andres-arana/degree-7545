module NotificationEmail
  extend ActiveSupport::Concern

  included do
    after_create :send_notification_email
  end

  def send_notification_email
    NotificationMailer.notify(self).deliver
  end
end
