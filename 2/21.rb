# frozen_string_literal: true

depth = 0
horizontal = 0

lines = File.open("#{__dir__}/input.txt").readlines

lines.each do |line|
  command, value = line.split(' ')

  case command
  when 'forward'
    horizontal += value.to_i
  when 'up'
    depth -= value.to_i
  when 'down'
    depth += value.to_i
  end
end

puts depth, horizontal, depth * horizontal
