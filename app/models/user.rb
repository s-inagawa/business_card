class User < ActiveRecord::Base
  belongs_to :group
  has_many :name_cards

  validates :name, presence: true, length: {maximum: AVAILABLE_TEXT_LENGTH}
  validates :tel, format: {with: /\A[0-9]{2,4}-[0-9]{2,4}-[0-9]{4}\Z/}
end
