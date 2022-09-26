class PatientsController < ApplicationController

  def destroy
    @doctor = Doctor.find(params[:doctor_id])
    @doctor.patients.destroy(params[:id])
    
    redirect_to doctor_path(@doctor.id)
  end
end