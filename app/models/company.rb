class Company < ApplicationRecord
  belongs_to :job, optional: true
end
