class TipTagRelation < ApplicationRecord
  belongs_to :tip
  belongs_to :tag
end
