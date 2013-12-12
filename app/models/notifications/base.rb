module Notifications
  class Base
    delegate :url_helpers, to: 'Rails.application.routes'
  end
end
