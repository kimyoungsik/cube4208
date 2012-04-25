class Item < ActiveRecord::Base
  has_many :entries
  belongs_to :category
end
