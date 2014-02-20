class User < ActiveRecord::Base
  belongs_to :group
  has_many :name_cards
end
