# frozen_string_literal: true

require 'pp'

lines = File.open("#{__dir__}/input.txt").readlines

positions = lines[0].split(',').map(&:to_i).sort

outcome_positions = {}

def fuel_cost(steps)
  steps.times.map { |p| p + 1 }.sum
end

positions.size.times do |i|
  outcome_positions[i + 1] = positions.map { |p| fuel_cost((p - (i + 1)).abs) }.sum
end

minimal = outcome_positions.min_by { |_, v| v }

pp minimal
