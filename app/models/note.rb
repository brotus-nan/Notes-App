class Note < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 10 }
  validate :user_must_exist
  belongs_to :user

  private
  def user_must_exist
    errors.add(:user, "must exist") unless User.exists?(self.user_id)
  end
end
