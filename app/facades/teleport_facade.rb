class TeleportFacade
  class << self
    def get_salaries(destination, forecast)
      data = TeleportService.find_salaries(destination)
      jobs = post_turing_jobs(data[:salaries])
      # binding.pry
      Salary.new(salary_data(destination, forecast, jobs))
    end

    def post_turing_jobs(salaries)
          job_titles = [
                          'Data Analyst',
                          'Data Scientist',
                          'Mobile Developer',
                          'QA Engineer',
                          'Software Engineer',
                          'Systems Administrator',
                          'Web Developer'
                        ]
      salaries.find_all do |job_data|
        job_titles.include?(job_data[:job][:title])
      end
    end

    def salary_data(destination, forecast, jobs)
      {
        destination: destination,
        forecast: salary_forecast(forecast.current_weather),
        salaries: salaries(jobs)
      }
    end

    def salary_forecast(current_weather)
      {
        summary: current_weather.conditions,
        temperature: "#{current_weather.temperature.to_i} F"
      }
    end

    def salaries(jobs)
      jobs.map do |data|
        {
          title: data[:job][:title],
          min: "$#{data[:salary_percentiles][:percentile_25].round(2)}",
          max: "$#{data[:salary_percentiles][:percentile_75].round(2)}"
        }
      end
    end
  end
end
