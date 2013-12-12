class Notification < ActiveRecord::Base
  include NotificationEmail

  belongs_to :user

  validates :description, presence: true
  validates :link, presence: true
  validates :user, presence: true

  def self.deliver!(notification)
    notification.users.each do |user|
      Notification.create!(
        description: notification.description,
        link: notification.link,
        user: user
      )
    end
  end
end
