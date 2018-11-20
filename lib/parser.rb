require 'json'
require_relative "config"

class JobParser
  attr_accessor :job_classes
  def initialize
    file = File.read("../data/classes.json")
    @job_classes = JSON.parse(file)
  end
end
