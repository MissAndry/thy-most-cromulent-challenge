class Parser
  attr_reader :filename

  def initialize(filename)
    @filename = filename
    @parsed = parsed
  end

  def parsed
    @parsed ||= File.readlines(filename).map{ |insult| insult.strip }
  end

end