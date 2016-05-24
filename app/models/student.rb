class Student
  attr_reader :first_name,
              :last_name

  def self.service
    @service ||= WizardService.new
  end

  def self.all
    service.students.map { |student| Student.new(student)}
  end

  def self.find(id)
    Student.new(service.student(id))
  end

  def initialize(data)
    @first_name = data["first_name"]
    @last_name = data["last_name"]
  end
end
