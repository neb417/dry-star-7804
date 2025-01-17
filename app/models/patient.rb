class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def self.adult_patients
    where('patients.age >= ?', 18)
    .order(:name)
  end
end