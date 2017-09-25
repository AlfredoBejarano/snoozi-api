class Dog < ActiveRecord::Base
  validates :breed, :color, :found_location, :found_date, :description, :number, :presence => true
end
