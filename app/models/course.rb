class Course < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  after_create :send_mail_to_user

  scope :paginate_records, -> (cursor, size) {
    order(id: 'desc').limit(size || 10).offset(cursor || 0)
  }

  enum state: [:active, :disabled]

  private
  def send_mail_to_user
    UserMailer.inform_user
  end
end
