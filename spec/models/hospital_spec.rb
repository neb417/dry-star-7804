require 'rails_helper'

RSpec.describe Hospital do
  it {should have_many :doctors}
  it {should have_many(:doctor_patients).through(:doctors)}

  describe 'instance methods' do
    before(:each) do
      @hospital_1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
      @hospital_2 = Hospital.create!(name: 'Seaside Health & Wellness Center')
  
      @doctor_1 = @hospital_1.doctors.create!( name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University')
      @doctor_2 = @hospital_1.doctors.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University')
      @doctor_3 = @hospital_2.doctors.create!(name: 'Miranda Bailey', specialty: 'General Surgery', university: 'Stanford University')
      @doctor_4 = @hospital_2.doctors.create!(name: 'Derek McDreamy Shepherd', specialty: 'Attending Surgeon', university: 'University of Pennsylvan2a')
  
      @patient_1 = Patient.create!(name: 'Katie Bryce', age: 24)
      @patient_2 = Patient.create!(name: 'Denny Duquette', age: 39)
      @patient_3 = Patient.create!(name: 'Rebecca Pope', age: 32)
      @patient_4 = Patient.create!(name: 'Zola Shepherd', age: 2)
  
      @doctor_1.patients << [@patient_2, @patient_4]
      @doctor_2.patients << [@patient_1, @patient_3, @patient_4]
      @doctor_3.patients << [@patient_1, @patient_4]
    end

    xit '.doctors_with_patient_count' do
      expect(@hospital_1.doctors_with_patient_count.first).to eq(3)
      expect(@hospital_1.doctors_with_patient_count[1]).to eq(2)
    end
  end
end
