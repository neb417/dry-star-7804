class HospitalsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
    @doctors = @hospital.doctors_with_patient_count
  end
end