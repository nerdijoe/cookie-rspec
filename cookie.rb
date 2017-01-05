class Cookie
  attr_reader :type

  def initialize(type)
    @type = type
    @time_baked = 0
  end

  def bake!(time)
    if time.is_a? Integer
      @time_baked += time
      self
    else
      raise "please pass an integer argument"
    end
  end

  def status
    case
    when @time_baked < 7
      :doughy
    when @time_baked < 10
      :almost_ready
    when @time_baked < 12
      :ready
    when @time_baked >= 12
      :burned
    else
      raise "Cookie does not have a status"
    end
  end
end
