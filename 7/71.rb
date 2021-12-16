# frozen_string_literal: true

require 'pp'

lines = File.open("#{__dir__}/input.txt").readlines

positions = lines[0].split(',').map(&:to_i).sort

outcome_positions = {}

positions.size.times do |i|
  outcome_positions[i + 1] = positions.map { |p| (p - (i + 1)).abs }.sum
end

minimal = outcome_positions.min_by { |_, v| v }

pp minimal
