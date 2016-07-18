namespace :create do
  desc "Creates contracts of accepted offers"
  task :contracts => :environment do
		Offer.where(status: 'accepted').each do |offer|
			Contract.create(
				seller_org_id: offer.seller.org_id,
				buyer_org_id: offer.spec.buyer.org_id,
				offer_id: offer.id,
				spec_id: offer.spec_id
			)
		end
    puts 'Done!'
  end
end
