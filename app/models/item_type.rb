class ItemType < ActiveRecord::Base
  belongs_to :category
  has_many :items
end
