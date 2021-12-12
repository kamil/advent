# frozen_string_literal: true

prev_value = nil
up_count = 0

File.open("#{__dir__}/input.txt").readlines.map(&:to_i).each do |measurenment|
  up_count += 1 if !prev_value.nil? && (prev_value < measurenment)
  prev_value = measurenment
end

puts up_count
