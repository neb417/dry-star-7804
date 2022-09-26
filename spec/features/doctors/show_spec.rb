require "rails_helper"

RSpec.describe 'Doctor Show Page' do
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

    @doctor_1.patients << [@patient_1, @patient_2, @patient_4]
    @doctor_2.patients << [@patient_3, @patient_4]
    @doctor_3.patients << [@patient_1, @patient_4]
  end

  describe 'As a visitor' do
    describe 'visiting the Doctor Show Page' do
      it 'all of the Doctor attributes are seen' do
        visit doctor_path(@doctor_1.id)

        expect(page).to have_content(@doctor_1.name)
        expect(page).to have_content(@doctor_1.specialty)
        expect(page).to have_content(@doctor_1.university)

        expect(page).to_not have_content(@doctor_2.name)
        expect(page).to_not have_content(@doctor_3.name)
        expect(page).to_not have_content(@doctor_4.university)
      end

      it 'the hospital where the doctor works is listed with doctor information' do
        visit doctor_path(@doctor_2.id)

        expect(page).to have_content(@hospital_1.name)
        expect(page).to_not have_content(@hospital_2.name)
      end

      it 'all of the doctor patients are listed' do
        visit doctor_path(@doctor_3)

        within("#doctor_patients_#{@doctor_3.id}") do
          expect(page).to have_content(@patient_1.name)
          expect(page).to have_content(@patient_4.name)
          expect(page).to_not have_content(@patient_3.name)
          expect(page).to_not have_content(@patient_2.name)
        end
      end
    end
  end
end