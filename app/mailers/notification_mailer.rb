class NotificationMailer < ActionMailer::Base
  default from: "notificaciones@hayequipo.com.ar"

  def notify(notification)
    @notification = notification

    mail(
      to: @notification.user.email,
      subject: "Noticias de ¡Hay Equipo!"
    )
  end
end
