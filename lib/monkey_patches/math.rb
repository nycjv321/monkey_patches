module Math
  # Performs a logarithmic sleep based on a set of integers or up to an input integer
  def Math.natural_logarithmic_sleep(set, constant_multiplier=1, stepping_factor=1, debugging=false)
    require 'Logger'
    logger = Logger.new(STDOUT)
    logger.level = Logger::DEBUG

    total_sleep_time = 0
    if !set.is_a? Array and !set.is_a? Range
      set = (1 .. set)
    end

    logger.debug("Constant multiplier for logarithmic scale is set to #{constant_multiplier}") if debugging
    logger.debug("Stepping factor is #{stepping_factor}") if stepping_factor > 1 and stepping_factor != set.size and debugging

    set.step(stepping_factor) do |iteration|
      logarithm = Math.log iteration
      sleep_time = logarithm * constant_multiplier
      logger.debug("Iteration #{iteration} sleeping for #{sleep_time} seconds (zZz)") if debugging
      yield sleep_time, iteration, stepping_factor
      sleep(sleep_time) unless debugging
      total_sleep_time += sleep_time

    end
    logger.debug("Slept for #{total_sleep_time} seconds (zZzZz)") if debugging
  end
end