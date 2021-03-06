class Midori::EventSource
  attr_accessor :connection

  def initialize(connection)
    @connection = connection
  end

  def send(data)
    raise Midori::Error::EventSourceTypeError unless data.is_a?String
    @connection.send_data(data.split("\n").map {|str| "data: #{str}\n"}.join + "\n")
    @connection.close_connection_after_writing
  end
end
