
class Api::V1::SalariesController < ApplicationController

  def index
    forecast = WeatherFacade.get_forecast(params[:destination])
    salary_data = TeleportService.find_salaries(params[:destination])


    job_titles = ['Data Analyst',
                    'Data Scientist',
                    'Mobile Developer',
                    'QA Engineer',
                    'Software Engineer',
                    'Systems Administrator',
                    'Web Developer']

    jobs = salary_data[:salaries].find_all do |job_data|
      job_titles.include?(job_data[:job][:title])
    end

    salary_info = {
      destination: params[:destination],
      forecast: salary_forecast(forecast.current_weather),
      salaries: salary_info(jobs)
    }

    render json: SalariesSerializer.new(Salary.new(salary_info))
  end

  private

  def salary_forecast(current_weather)
    {
      summary: current_weather.conditions,
      temperature: current_weather.temperature
    }
  end

  def salary_info(jobs)
    jobs.map do |data|
      {
        title: data[:job][:title],
        min: data[:salary_percentiles][:percentile_25],
        max: data[:salary_percentiles][:percentile_75]
      }
    end
  end
end
