class Hospital < ApplicationRecord
  has_many :doctors
  has_many :doctor_patients, through: :doctors

  def doctors_with_patient_count
    # binding.pry
    doctors
    .select('doctors.*, doctor_patients.*, count(doctor_patients.patient_id) AS patient_count')
    .order(patient_count: :desc)
  end
end
