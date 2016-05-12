class Dog < ActiveRecord::Base
  validates :breed, :color, :gender, :found_location, :found_date, :description, :number, :image, :presence => true

  has_attached_file :image, 
  styles: {
    thumb: ["196x196#", :jpg], 
    original: ['512x512>', :jpg] 
  },
  convert_options: {
    thumb: '-quality 75 -strip',
    original: '-quality 85 -strip' 
  },
  url: '/system/:hash.:extension',
  hash_secret: 'doge18'

  validates_attachment :image, presence: true,
  content_type: {
    content_type: ['image/jpeg', 'image/jpg', 'image/png'] },
  size: { in: 0..1024.kilobytes }   
end
