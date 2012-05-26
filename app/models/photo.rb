class Photo < ActiveRecord::Base

  belongs_to :entry
  mount_uploader :image, ImageUploader
  
  validates :entry_id, :presence => true
  validates :image, :presence => true
end
