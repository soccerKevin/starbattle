class Map < ActiveRecord::Base
  has_many :squares, dependent: :destroy
  accepts_nested_attributes_for :squares, allow_destroy: true
end
