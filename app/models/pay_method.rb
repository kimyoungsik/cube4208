class PayMethod < ActiveRecord::Base
  has_many :entries
  has_many :expense
end
