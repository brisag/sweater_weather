require 'rails_helper'

RSpec.describe "Teleport Search" do
  it "returns salaries of a location", :vcr do

    location = "denver"
    response = TeleportService.find_salaries(location)

    expect(response).to be_a Hash
    expect(response).to have_key(:_links)
    expect(response[:_links]).to be_a Hash
    expect(response).to have_key(:salaries)
    expect(response[:salaries]).to be_an Array

    salary = response[:salaries].first

    expect(salary).to be_a Hash
    expect(salary).to have_key(:job)
    expect(salary[:job]).to be_a Hash
    expect(salary[:job]).to have_key(:id)
    expect(salary[:job][:id]).to be_a String
    expect(salary[:job]).to have_key(:title)
    expect(salary[:job][:title]).to be_a String
    expect(salary).to have_key(:salary_percentiles)
    expect(salary[:salary_percentiles]).to be_a Hash
    expect(salary[:salary_percentiles]).to have_key(:percentile_25)
    expect(salary[:salary_percentiles][:percentile_25]).to be_a Float
    expect(salary[:salary_percentiles]).to have_key(:percentile_50)
    expect(salary[:salary_percentiles][:percentile_50]).to be_a Float
    expect(salary[:salary_percentiles]).to have_key(:percentile_75)
    expect(salary[:salary_percentiles][:percentile_75]).to be_a Float
  end
end
