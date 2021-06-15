require 'rails_helper'

RSpec.describe Salary do
  before :each do
    @salary = Salary.new(
      {
        destination: "denver",
        forecast: { summary: "clear sky", temperature: '89 F' },
        salaries: [{title: 'Data Analyst', min: '$42878.34', max: '$62106.69'}]
      })
  end

  it 'exist and has has valid attributes' do
    expect(@salary).to be_instance_of(Salary)
    expect(@salary.destination).to be_a(String)
    # expect(@salary.destination).to eq("denver")
    expect(@salary.forecast).to be_a(Hash)
    # expect(@salary.forecast).to eq({ summary: "cloudy", temperature: '89 F' })
    expect(@salary.salaries).to be_an(Array)
    # expect(@salary.salaries).to eq([{title: 'Data Analyst', min: '$42878.34', max: '$62106.69'}])
  end
end
