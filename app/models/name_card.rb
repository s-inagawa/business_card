class NameCard < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true, length: {maximum: AVAILABLE_TEXT_LENGTH}
  validates :address, length: {maximum: AVAILABLE_LONG_STRING_LENGTH}, presence: true
  validates :url, length: {maximum: AVAILABLE_TEXT_LENGTH, allow: nil}, format: URI.regexp(['http', 'https']), allow_nil: true
  validates :tel, :fax, format: {with: /\A[0-9]{2,4}-[0-9]{2,4}-[0-9]{4}\Z/}
end
