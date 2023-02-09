# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Doctor.delete_all
Patient.delete_all
Appointment.delete_all

specialties = "IMMUNOLOGY ANESTHESIOLOGY DERMATOLOGY RADIOLOGY EMERGENCY FAMILY INTERNAL GENETICS NEUROLOGY NUCLEAR OBSTETRICS/GYNECOLOGY OPHTHALMOLOGY PATHOLOGY PEDIATRICS REHABILITATION PSYCHIATRY ONCOLOGY SURGERY UROLOGY".downcase.split

specialties.each do |specialty|
  spec = Specialty.create!(name: specialty)
end

3.times do
  city = City.create!(name: Faker::Address.city)
end

100.times do
  doctor = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Address.zip_code, city: City.find(rand(1..City.all.length)))
  Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

100.times do
  Appointment.create(date: Faker::Date.forward(days: 31), doctor_id: Doctor.all.sample.id, patient_id: Patient.all.sample.id)
end