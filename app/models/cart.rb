class Cart < ActiveRecord::Base
  has_many :oranges
  has_many :apples
end
