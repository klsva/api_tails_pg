class Company < ApplicationRecord
  validates :name, :location, presence: true, on: [:create, :update],
            length: { maximum: 50}
  validates_associated :jobs

  has_many :jobs

  def delete_company
    self.update_attribute(:deleted, true)
  end

end
