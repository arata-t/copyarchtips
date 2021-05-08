class Tip < ApplicationRecord
  belongs_to :user
  has_many :comments
  # has_one_attached :image
  mount_uploader :image, ImageUploader #carrierwave
  has_many :tip_tag_relations, foreign_key: :tip_id, dependent: :destroy
  has_many :tags, through: :tip_tag_relations

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :title, :description,       presence: true
  validates :category_id, numericality: { other_than: 1 }

  def self.search(search)
    if search != ''
      Tip.where('description LIKE(?)', "%#{search}%")
    else
      Tip.order(updated_at: :DESC)
    end
  end
end
