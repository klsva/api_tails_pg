class Geek < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50},
            on: [:create, :update]
  validates :stack, length: { maximum: 100}
  validates :resume, length: { maximum: 1000}
  validates_associated :applies

  has_many :applies
end
