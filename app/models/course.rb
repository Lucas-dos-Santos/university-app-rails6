class Course < ApplicationRecord
  validates :short_name, :name, :description, presence: true, length: { minimum: 3 }
  has_many :student_courses
  has_many :students, through: :student_courses
end
