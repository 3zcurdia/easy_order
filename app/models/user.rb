class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable
  enum role: %i[guest user merchant admin]
  validates :name, presence: true

  def self.create_guest
    guest_id = "#{Time.now.to_i}#{rand(100)}"
    user = new(name: "Guest #{guest_id}", email: "guest_#{guest_id}@example.com", role: :guest)
    user.save!(validate: false)
    user
  end
end
