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

winner_index = nil

numbers.each do |current_number|
  boards.each_with_index do |board, board_index|
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

    if winner_index
      pp boards[winner_index].flatten.compact.sum * current_number, current_number
      exit
    end
  end
end

pp won
