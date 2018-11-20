require_relative "parser.rb"
require_relative "util.rb"


class Job
  attr_accessor :job_name,
                :hp, :mp, :str, :dfn, :mag, :spd

  def initialize(jobname:, hp: 10, mp: 10, str: 5, dfn: 5, mag: 5, spd: 5)
    @job_name = jobname
    @hp, @mp = hp, mp
    @str, @dfn, @mag, @spd = str, dfn, mag, spd
  end

  def stats
    {hp: @hp, mp: @mp, str: @str, dfn: @dfn, mag: @mag, spd: @spd}
  end
end
class JobProto
  def initialize
    @p = JobParser.new
  end
  def create(job_name)
    stats = @p.job_classes[job_name]
    Job.new jobname: job_name, **(stats.symbolize_keys)
  end
end

class Character
  attr_accessor :name, :rank,
                :job, :lv,
                :hp, :mp,
                :str, :dfn, :mag, :spd

  def initialize(name, job)
    @name = name
    @rank = "E"
    @job = job
    @lv = 1
  end

  def stats=(other)
    @stats = { hp: @hp, mp: @mp, str: @str, dfn: @dfn, mag: @mag, spd: @spd }
    @stats.merge! other
  end

  def to_s
    "#{@name}, #{@job.job_name} #{@lv} Rank #{@rank}"
  end
end

job_proto = JobProto.new

warrior =  job_proto.create "Warrior"
hero = Character.new "Hero", warrior

system 'clear'
puts hero
