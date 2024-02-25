# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :lockable, :timeoutable, :trackable,
    :jwt_authenticatable, jwt_revocation_strategy: self

  attribute :currency, :string, default: 'inr'

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }

  has_one :budget, dependent: :destroy

  def name
    "#{first_name} #{last_name}"
  end
end
