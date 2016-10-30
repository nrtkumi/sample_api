class User < ApplicationRecord
  belongs_to :school
  validates :name, presence: true, uniqueness: true
  validates :school_id, presence: true
end
