class NameCard < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true, length: {maximum: AVAILABLE_TEXT_LENGTH}
  validates :address, presence: true, length: {maximum: AVAILABLE_LONG_STRING_LENGTH}
  validates :url, presence: true, length: {maximum: AVAILABLE_TEXT_LENGTH}, format: URI.regexp(['http', 'https'])
  validates :tel, :fax, format: {with: /\A[0-9]{2,4}-[0-9]{2,4}-[0-9]{4}\Z/}
end
