class Apply < ApplicationRecord
  validates :job_id, :geek_id, presence: true, on: [:create, ::update],
            numericality: {only_integer: true, greater_than_or_equal_to: 1}

  belongs_to :geeks, foreign_key: :geek_id
  belongs_to :jobs, foreign_key: :job_id
end
