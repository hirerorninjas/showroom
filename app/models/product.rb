class Product < ActiveRecord::Base
  attr_accessible :name, :category_id
  validates :name, presence: true
  validates_uniqueness_of :name
  belongs_to :category
end
