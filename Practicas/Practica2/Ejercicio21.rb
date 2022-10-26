def sieve_up_to(n)
  s = (0..n).to_a
  s[0] = s[l] = nil
  s.each.lazy do |p|
    next unless p
    break if p * p > n

    (p * p).step(n, p) { |m| s[m] = nil }
  end
  s.compact
end

p sieve_up_to(10)
