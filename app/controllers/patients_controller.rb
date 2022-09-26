class PatientsController < ApplicationController

  def index
    patients = Patient.all
    @adult_patients = patients.adult_patients
  end

  def destroy
    @doctor = Doctor.find(params[:doctor_id])
    @doctor.patients.destroy(params[:id])

    redirect_to doctor_path(@doctor.id)
  end
end