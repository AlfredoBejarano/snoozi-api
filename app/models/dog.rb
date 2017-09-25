class Dog < ActiveRecord::Base
  validates :image, :number, :presence => true
end
