class GhingerMailer < ApplicationMailer

  def payment_request(user, appt)
    @user = user
    @appt = appt
    user_email = @user.person_contact_infos[0].email
    mail( from: "Ghinger Health Care", to: user_email , subject: "Payment Request")
  end

end
