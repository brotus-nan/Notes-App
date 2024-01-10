class Note < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 10 }
  validate :user_must_exist
  belongs_to :user
  after_initialize :set_default_status, if: :new_record?


  $valid_statuses = { active: 1, archived: 2, deleted: 3  }


  private
  def user_must_exist
    errors.add(:user, "must exist") unless User.exists?(self.user_id)
  end

  def set_default_status
    self.status ||= $valid_statuses[:active]
  end

end
