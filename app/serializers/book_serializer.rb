class BookSerializer
  include FastJsonapi::ObjectSerializer
  attributes :destination, :forecast, :books
end
