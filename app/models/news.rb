class News < ActiveRecord::Base
  scope :recent, -> {order("id desc")}
end
