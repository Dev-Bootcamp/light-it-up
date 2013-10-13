class Element < ActiveRecord::Base

  validates :slide_id, presence: true
  validates :element_type_id, presence: true

  belongs_to :slide
  belongs_to :element_type

end
