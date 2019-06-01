class Job < ApplicationRecord
  validates :title, presence: true
  validates :category, presence: true
  validates :job_type, presence: true
  validates :headquarters, presence: true
  validates :region, presence: true
  validates :apply_link, presence: true
  validates :description, presence: true

  has_many :companies, dependent: :destroy
  accepts_nested_attributes_for :companies, allow_destroy: true, reject_if: :all_blank

  JOB_TYPE = ['Full-Time', 'Contract']
  CATEGORY = ['Design', 'Programming', 'Customer Support',
              'Copywriting', 'DevOps & Sysadmin', 'Sales & Marketing',
              'Business & Management', 'Finance & Legal', 'Product', 'All Other']
end
