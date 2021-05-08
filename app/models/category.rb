class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '法規・条例' },
    { id: 3, name: '納まり・詳細図' },
    { id: 4, name: '仕上げ' }
  ]

  include ActiveHash::Associations
  has_many :categories
end
