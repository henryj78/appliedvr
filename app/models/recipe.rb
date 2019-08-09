class Recipe < ApplicationRecord
  has_many :recipesteps, dependent: :destroy
  validates :title, presence: true
end
