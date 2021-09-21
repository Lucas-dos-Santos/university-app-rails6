class Course < ApplicationRecord
  validates :short_name, :name, :description, presence: true, length: { minimum: 3 }
end
