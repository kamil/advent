# frozen_string_literal: true

# rubocop:disable Layout/LineLength
puts File.open("#{__dir__}/input.txt").readlines.map { |l| l.split('|').last.strip }.map { |l| l.split(' ').map(&:size).select { |s| [2, 4, 3, 7].include?(s) } }.flatten.size
