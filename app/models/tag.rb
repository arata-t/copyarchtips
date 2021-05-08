class Tag < ApplicationRecord
  has_many :tip_tag_relations
  has_many :tips, through: :tip_tag_relations

  validates :name, uniqueness: true
end
