class Registration < ApplicationRecord
  has_many :registration_entries, dependent: :destroy

  accepts_nested_attributes_for :registration_entries, reject_if: :all_blank, allow_destroy: true

  validates :hotel_email, allow_blank: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def is_with_hotel_booking
    hotel_email.present?
  end
end
