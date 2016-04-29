class BuyerMailer < ApplicationMailer

  def new_offer(offer)
    @offer = offer
    mail(to: @offer.spec.buyer.email, subject: "Ny offert för: #{@offer.spec.title}")
  end
end
