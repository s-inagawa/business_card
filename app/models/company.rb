class Company < ActiveRecord::Base
  has_many :groups

  validates :name, presence: true, length: {maximum: AVAILABLE_TEXT_LENGTH}
  validates :address, presence: true, length: {maximum: AVAILABLE_LONG_STRING_LENGTH}
  validates :url, length: {maximum: AVAILABLE_TEXT_LENGTH}, format: URI.regexp(['http', 'https']), allow_blank: true
  validates :tel, :fax, format: {with: /\A[0-9]{2,4}-[0-9]{2,4}-[0-9]{4}\Z/}, allow_blank: true
end
