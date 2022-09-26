class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
    @hospital = @doctor.hospital
    @patients = @doctor.patients
  end
end