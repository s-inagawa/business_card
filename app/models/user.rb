class User < ActiveRecord::Base
  belongs_to :group
  has_many :name_cards

  SHORT_LENGTH = 6
  validates :name, presence: true, length: { maximum: AVAILABLE_TEXT_LENGTH }
  validates :tel, format: { with: /\A[0-9]{2,4}-[0-9]{2,4}-[0-9]{4}\Z/ }
  validates :mail, length: {maximum: AVAILABLE_TEXT_LENGTH, minimun: SHORT_LENGTH }, allow_blank: true,
                   uniqueness: true, format: { with: /\A[A-Z0-9%\.\_\-\+]+@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
end
