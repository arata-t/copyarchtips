class TipTag
  include ActiveModel::Model
  attr_accessor :title, :category_id, :description, :user_id, :image, :name, :id, :_method, :authenticity_token, :commit, :tip

  validates :category_id, numericality: { other_than: 1 }
  with_options presence: true do
    validates :title, :description, presence: true
  end

  delegate :persisted?, to: :tip

  def initialize(attributes = nil, tip: Tip.new)
    @tip = tip
    attributes ||= default_attributes
    super(attributes)
  end

  def save(tag_list)
    ActiveRecord::Base.transaction do
      @tip.update(title: title, category_id: category_id, description: description, image: image, user_id: user_id)
      @tip.tip_tag_relations.each do |tag|
        tag.delete
      end

      tag_list.each do |tag_name|
        tag = Tag.where(name: tag_name).first_or_initialize
        tag.save
        tip_tag = TipTagRelation.where(tip_id: @tip.id, tag_id: tag.id).first_or_initialize
        tip_tag.update(tip_id: @tip.id, tag_id: tag.id)
      end
    end
  end

  def to_model
    tip
  end

  private

  attr_reader :tip

  def default_attributes
    {
      title: tip.title,
      category_id: tip.category_id,
      description: tip.description,
      image: tip.image,
      name: tip.tags.pluck(:name).join(',')
    }
  end
end
