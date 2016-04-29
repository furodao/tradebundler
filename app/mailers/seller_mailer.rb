class SellerMailer < ApplicationMailer

  def offer_accepted(offer)
    @offer = offer
    mail(to: @offer.seller.email, subject: "Din offert har accepterats!")
  end
end
