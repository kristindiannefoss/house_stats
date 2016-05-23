class WizardService
  attr_reader :connection

  def initialize
    # @connection = Faraday::Client.new('http://localhost:3000/api/v1')
    @connection = Hurley::Client.new('http://localhost:3000/api/v1')
  end

  def students
    parse(connection.get("students"))
  end

  def student(id)
    parse(connection.get("students/#{id}"))
  end

  def houses
    parse(connection.get("houses"))
  end

  def house(id)
    parse(connection.get("houses/#{id}"))
  end

  private

  def parse(response)
    JSON.parse(response.body)
  end
end
