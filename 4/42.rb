# frozen_string_literal: true

require 'pp'

lines = File.open("#{__dir__}/input.txt").readlines

numbers = lines.shift.split(',').map(&:to_i)

BOARD_SIZE = 5

boards = []

while lines.any?
  board_lines = lines.shift(6)
  board_lines.shift
  boards << board_lines.map { |line| line.split(' ').map(&:to_i) }
end

winners = []
# won = false

numbers.each do |current_number|
  boards.each_with_index do |board, board_index|
    next if winners.include?(board_index)

    winner_index = nil

    board.each do |row|
      index = row.index(current_number)
      row[index] = nil if index
    end

    board.each_with_index do |row, _row_index|
      winner_index = board_index if row.all? { |number| number.nil? }
      row.each_with_index do |_col, col_index|
        winner_index = board_index if board.transpose[col_index].all? { |number| number.nil? }
      end
    end

    # next unless winners.size == boards.size - 1
    next unless winner_index

    winners << winner_index
    pp boards[winner_index].flatten.compact.sum * current_number
  end
end
