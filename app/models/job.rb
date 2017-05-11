class Job < ApplicationRecord
  validates :name, :place, :company_id, presence: true,
            on: [:create, :update]
  validates :name, :place, length: {maximum: 50}
  validates :company_id, numericality: {only_integer: true, greater_than_or_equal_to: 1}

  validates_associated :applies

  belongs_to :company, foreign_key: :company_id
  has_many :applies
end
