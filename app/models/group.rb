class Group < ActiveRecord::Base
  belongs_to :company
  has_many :users

  validates :name, presence: true, length: {maximum: AVAILABLE_SHORT_STRING_LENGTH}
end
