class Accomodation < ApplicationRecord
  belongs_to :trip
  enum kind: [:hotel, :camping, :auberge, :b_b, :habitant,]
  accepts_nested_attributes_for :stays, reject_if: :all_blank
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
