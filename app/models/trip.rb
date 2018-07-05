class Trip < ApplicationRecord
  has_many :checklists, dependent: :destroy
  has_many :travels, dependent: :destroy
  has_many :accomodations, dependent: :destroy
  belongs_to :user
end
