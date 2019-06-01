class Company < ApplicationRecord
  validates :name, presence: true
  validates :statement, presence: true
  validates :url, presence: true
  validates :email, presence: true
  validates :company_description, presence: true

  belongs_to :job, optional: true
  has_one_attached :company_logo
end
