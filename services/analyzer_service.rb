class AnalyzerService
  def initialize(request)
    @request = request
  end

  def report
    "Time: #{time};\r\nUser IP: #{ip};\r\nUser Agent: #{user_agent};"
  end

  private

  def time
    Time.now
  end

  def ip
    @request.ip
  end

  def user_agent
    @request.user_agent
  end
end
