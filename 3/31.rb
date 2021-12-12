# frozen_string_literal: true

lines = File.open("#{__dir__}./input.txt").readlines

line_width = lines.first.size - 1

vertical = []

line_width.times do |i|
  vertical[i] = []
  lines.each do |line|
    vertical[i] << line[i].to_i
  end
end

gamma = []

line_width.times do |i|
  gamma << vertical[i].max_by { |ix| vertical[i].count(ix) }
end

epsilon = gamma.map { |e| e.zero? ? 1 : 0 }

puts gamma.join.to_i(2) * epsilon.join.to_i(2)
