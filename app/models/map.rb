class Map < ActiveRecord::Base
  validates :name, presence: :true

  has_many :squares, dependent: :destroy
  accepts_nested_attributes_for :squares, allow_destroy: true
  validates_associated :squares
end
