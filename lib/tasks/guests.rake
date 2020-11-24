# frozen_string_literal: true

namespace :guests do
  desc 'Deletes all guest accounts from the last 24 hours'
  task clear: :environment do
    User.guests_without_demo.destroy_all
    User.guest.where('created_at < ?', 72.hours.ago).destroy_all
  end
end
