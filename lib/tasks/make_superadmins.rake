namespace :create do
  desc "Creates asuperadmin"
  task :superadmins => :environment do
    sellers = Seller.where(email: ['khoury@live.se', 'mikael.furo@nespresso-pro.se'])
    sellers.each do |s|
      s.update_attribute :role, 'superadmin'
    end
    puts 'Done!'
  end
end
