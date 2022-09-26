require "rails_helper"

RSpec.describe 'Doctor Show Page' do
  before(:each) do
    @hospital_1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
    @hospital_2 = Hospital.create!(name: 'Seaside Health & Wellness Center')

    @doctor_1 = @hospital_1.doctors.create!( name: 'Meredith Grey', specialty: 'General Surgery', education: 'Harvard University')
    @doctor_2 = @hospital_1.doctors.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', education: 'Johns Hopkins University')
    @doctor_3 = @hospital_2.doctors.create!(name: 'Miranda Bailey', specialty: 'General Surgery', education: 'Stanford University')
    @doctor_4 = @hospital_2.doctors.create!(name: 'Derek McDreamy Shepherd', specialty: 'Attending Surgeon', education: 'University of Pennsylvan2a')

    @patient_1 = Patient.create!(name: 'Katie Bryce', Age: 24)
    @patient_2 = Patient.create!(name: 'Denny Duquette', Age: 39)
    @patient_3 = Patient.create!(name: 'Rebecca Pope', Age: 32)
    @patient_4 = Patient.create!(name: 'Zola Shepherd', Age: 2)

    @doctor_1.patients << [@patient_1, @patient_2, @patient_4]
    @doctor_2.patients << [@patient_3, @patient_4]
    @doctor_3.patients << [@patient_1, @patient_4]
  end

  
end