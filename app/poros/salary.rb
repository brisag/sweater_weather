class Salary
  attr_reader :id,
              :destination,
              :forecast,
              :salaries

  def initialize(data)
    @destination = data[:destination]
    @forecast    = data[:forecast]
    @salaries    = data[:salaries]
  end
end

#
# {
#   "data": {
#     "id": "null",
#     "type": "salaries",
#     "attributes": {


#       "destination": "chicago",


#       "forecast": {
#         "summary": "Cloudy with a chance of meatballs",
#         "temperature": "83 F"
#       },


#       "salaries": [
#         {
#           "title": "Data Analyst",
#           "min": "$46,898.19",
#           "max": "$67,929.19",
#         },
#           "title": "Data Scientist",
#           "min": "$71,025.60",
#           "max": "$103,647.55",
#         },
#         { ... etc ... }
#       ]
#     }
#   }
# }
