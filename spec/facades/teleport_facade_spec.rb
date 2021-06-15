# require 'rails_helper'
#
# RSpec.describe TeleportFacade do
#   describe "get_salaries" do
#     it "gets input salaries" do
#       forecast = WeatherFacade.get_forecast('denver')
#       response = TeleportFacade.get_salaries('denver', forecast)
#       expect(response).to be_instance_of(Salary)
#       expect(response.destination).to eq('denver')
#       expect(response.forecast).to be_a(Hash)
#       expect(response.salaries).to be_an(Array)
#     end
#   end
#
#   describe "post_turing_jobs(all_job_salaries)" do
#     it 'gets salary info for the specif jobs' do
#       salary_data = TeleportService.find_salaries('denver')
#       specific_jobs = TeleportFacade.post_turing_jobs(salary_data[:salaries])
#
#       expect(specific_jobs).to be_an(Array)
#       expect(specific_jobs.first).to be_a(Hash)
#     end
#   end
#
#   describe "salary_data(destination, forecast, jobs)" do
#     it 'pulls up destination, forecast, and salary info' do
#       forecast = WeatherFacade.get_forecast('denver')
#       data = TeleportService.find_salaries('denver')
#       specific_jobs = TeleportFacade.post_turing_jobs(data[:salaries])
#       salary_data = TeleportFacade.salary_data('denver', forecast, specific_jobs)
#
#       expect(salary_data).to be_a(Hash)
#       expect(salary_data).to have_key(:destination)
#       expect(salary_data).to have_key(:forecast)
#       expect(salary_data).to have_key(:salaries)
#
#       expect(salary_data[:destination]).to be_a(String)
#       expect(salary_data[:forecast]).to be_a(Hash)
#       expect(salary_data[:salaries]).to be_a(Array)
#     end
#   end
#
#   describe "salary_forecast(current_weather)" do
#     it 'gets weather' do
#       forecast = WeatherFacade.get_forecast('denver')
#       salary_forecast = TeleportFacade.salary_forecast(forecast.current_weather)
#
#       expect(salary_forecast).to be_a(Hash)
#       expect(salary_forecast).to have_key(:summary)
#       expect(salary_forecast).to have_key(:temperature)
#
#       expect(salary_forecast[:summary]).to be_a(String)
#       expect(salary_forecast[:temperature]).to be_a(String)
#     end
#   end
#
#   describe "salaries(jobs)" do
#     it 'gets salary range' do
#       data = TeleportService.find_salaries('denver')
#       specific_jobs = TeleportFacade.post_turing_jobs(data[:salaries])
#       salaries = TeleportFacade.salaries(specific_jobs)
#
#       expect(salaries).to be_an(Array)
#
#       salaries.each do |salary_info|
#         expect(salary_info).to be_a(Hash)
#         expect(salary_info).to have_key(:title)
#         expect(salary_info).to have_key(:min)
#         expect(salary_info).to have_key(:min)
#       end
#     end
#   end
# end
