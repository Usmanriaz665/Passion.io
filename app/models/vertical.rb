class Vertical < ApplicationRecord
  has_many :categories, dependent: :destroy
  validates :name, presence: true
  validate :check_overlapping_categories, on: [:create, :update]
  after_create :send_mail_to_user

  scope :paginate_records, -> (cursor, size) {
    order(id: 'desc').limit(size || 10).offset(cursor || 0)
  }

  private
  def send_mail_to_user
    UserMailer.inform_user
  end

  def check_overlapping_categories
    category = Category.find_by_name(name)
    raise_validation_error if category.present?
  end
end
