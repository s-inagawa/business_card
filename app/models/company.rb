class Company < ActiveRecord::Base
  has_many :groups

  validate :name, presence: true, length: {maximum: AVAILABLE_LONG_STRING_LENGTH}
  validate :address, presence: true, length: {maximum: AVAILABLE_TEXT_LENGTH}
  validate :url, length: {maximum: AVAILABLE_LONG_STRING_LENGTH}
  validate :tel, :fax, format: {with: /[0-9]{2,4}-[0-9]{2,4}-[0-9]{4}/}
end
