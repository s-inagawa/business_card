class Group < ActiveRecord::Base
  belongs_to :company
  has_many :users
end
