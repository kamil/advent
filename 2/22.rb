# frozen_string_literal: true

depth = 0
horizontal = 0
aim = 0

lines = File.open("#{__dir__}/input.txt").readlines

lines.each do |line|
  command, value = line.split(' ')

  case command
  when 'forward'
    horizontal += value.to_i
    depth += value.to_i * aim if aim != 0
  when 'up'
    aim -= value.to_i
  when 'down'
    aim += value.to_i
  end
end

puts depth, horizontal, depth * horizontal
