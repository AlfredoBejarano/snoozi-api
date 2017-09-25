class Dog < ActiveRecord::Base
  validates :breed, :color, :gender, :found_location, :found_date, :description, :number, :image, :presence => true
end
