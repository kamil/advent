# frozen_string_literal: true

up_count = 0

sum_a = 0
sum_b = 0

lines = File.open("#{__dir__}/input.txt").readlines.map(&:to_i)

lines.each_with_index do |_, index|
  sum_a = lines.slice(index, 3).sum
  sum_b = lines.slice(index + 1, 3).sum

  up_count += 1 if sum_b > sum_a
end

puts up_count
