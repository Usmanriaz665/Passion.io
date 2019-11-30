class Category < ApplicationRecord
  belongs_to :vertical
  has_many :courses, dependent: :destroy
  validate :check_overlapping_verticals, on: [:create, :update]
  after_create :send_mail_to_user

  scope :paginate_records, -> (cursor, size) {
    order(id: 'desc').limit(size || 10).offset(cursor || 0)
  }
  enum state: [:active, :disabled]

  private
  def send_mail_to_user
    UserMailer.inform_user
  end

  def check_overlapping_verticals
    vertical = Vertical.find_by_name(name)
    raise_validation_error if vertical.present?
  end
end
