namespace :guests do
  desc 'Deletes all guest accounts from the last 24 hours'
  task clear: :environment do
    User.guest.where('created_at < ?', 24.hours.ago).destroy_all
  end
end
