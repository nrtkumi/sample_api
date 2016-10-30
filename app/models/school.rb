class School < ApplicationRecord
  has_many :users
  validates :name, presence: true, uniqueness: true
  validates :member, presence: true
  validates :place, presence: true
  validates :description, presence: true
end
