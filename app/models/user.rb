class User < ActiveRecord::Base
  has_many :notes
  validates :title, length: { maximum: 140 }
end
