class Flight
  attr_reader :database_handle, :flight_number

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
end