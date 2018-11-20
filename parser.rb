require 'json'
class JobParser
  attr_accessor :job_classes
  def initialize
    file = File.read("classes.json")
    @job_classes = JSON.parse(file)
  end
end
