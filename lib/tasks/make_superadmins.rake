namespace :create do
  desc "Creates asuperadmin"
  task :superadmins => :environment do
    s = Seller.where(email: 'khoury@live.se').first
    s.update_attribute :role, 'superadmin'
    puts 'Done!'
  end
end
