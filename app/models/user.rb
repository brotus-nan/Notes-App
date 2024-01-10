class User < ApplicationRecord
  has_many :notes
  validates :email, presence: true, uniqueness: true
end
