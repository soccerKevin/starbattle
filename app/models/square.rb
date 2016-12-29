class Square < ActiveRecord::Base
  belongs_to :map
  validates :color, presence: true
  validates :group_index, presence: true

  def validates?
    color.present? && group_index.present?
  end
end
