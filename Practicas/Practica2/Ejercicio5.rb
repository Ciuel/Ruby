class Time
  def self.midnight
    now=Time.now
    Time.new(now.year, now.month, now.day+1, 0, 0, 0, now.zone)
  end
end

def cuanto_falta? check=Time.midnight
  ((check-Time.now)/60).to_i
end

puts cuanto_falta? Time.new(2032, 12, 31, 23, 59, 59)
puts cuanto_falta?