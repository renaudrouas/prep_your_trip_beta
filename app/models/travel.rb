class Travel < ApplicationRecord
  belongs_to :trip
  validates :start_date, presence: true
  validates :address_in, presence: true
  validates :address_out, presence: true
  enum mode: [:avion,:train,:car,:bateau,:voiture,]
end
