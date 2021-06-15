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

    # keys  [:job, :salary_percentiles]

    expect(salary).to be_a Hash
    expect(salary).to have_key(:job)
    expect(salary[:job]).to be_a Hash
    # keys #=> [:id, :title]
    expect(salary[:job]).to have_key(:id)
    expect(salary[:job][:id]).to be_a String
    expect(salary[:job]).to have_key(:title)
    expect(salary[:job][:title]).to be_a String
    expect(salary).to have_key(:salary_percentiles)
    # keys => [:percentile_25, :percentile_50, :percentile_75]
    expect(salary[:salary_percentiles]).to be_a Hash
    expect(salary[:salary_percentiles]).to have_key(:percentile_25)
    expect(salary[:salary_percentiles][:percentile_25]).to be_a Float
    expect(salary[:salary_percentiles]).to have_key(:percentile_50)
    expect(salary[:salary_percentiles][:percentile_50]).to be_a Float
    expect(salary[:salary_percentiles]).to have_key(:percentile_75)
    expect(salary[:salary_percentiles][:percentile_75]).to be_a Float
  end

  describe "sad path" do
    xit "returns an empty hash if location is empty" do
    end
  end
end

#
#
# You will be using Teleport’s API to find tech salary information in a destination city provided by the user. Presume that your user will always provide a known “good” location. (you can handle edge cases and sad paths after you implement the core functionality)
# Your endpoint should follow this format:
# GET /api/v1/salaries?destination=chicago
# please do not deviate from the names of the endpoint or query parameter, be sure it is called “salaries” and “destination”, respectively
