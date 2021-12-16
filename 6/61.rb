# frozen_string_literal: true

require 'pp'

lines = File.open("#{__dir__}/input.txt").readlines

lanternfishes = lines[0].split(',').map(&:to_i).group_by { |value| value }.transform_values(&:size)

256.times do
  lanternfishes = lanternfishes.transform_keys { |key| key - 1 }

  lanternfishes[6] = (lanternfishes[6] || 0) + (lanternfishes[-1] || 0)
  lanternfishes[8] = lanternfishes[-1]
  lanternfishes[-1] = 0
end

pp lanternfishes.values.sum
