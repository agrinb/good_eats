class Review < ActiveRecord::Base
  belongs_to :restuarant
  accepts_nested_attributes_for :restuarant
end
