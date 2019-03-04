class Company < ApplicationRecord
  has_many :complaints, dependent: :destroy
  validates :name, presence: true
end
