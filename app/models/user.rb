# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :omniauthable
  enum role: %i[guest user merchant admin]
  has_many :merchants, dependent: :destroy

  scope :guests_without_demo, -> { guest.where.not(id: Merchant.owned_by(guest).select(:user_id)) }

  def self.create_guest
    guest_id = "#{Time.now.to_i}#{rand(100)}"
    user = new(name: "Guest #{guest_id}", email: "guest_#{guest_id}@example.com", role: :guest)
    user.save!(validate: false)
    user
  end

  def token
    JwtWrapper.encode({ sub: id })
  end
end
