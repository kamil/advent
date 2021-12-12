# frozen_string_literal: true

require 'pp'

lines = File.open("#{__dir__}/input.txt").readlines

max_x = 0
max_y = 0

cords = []

lines.each do |line|
  start_cord, end_cord = line.split(' -> ')
  start_x, start_y = start_cord.split(',').map(&:to_i)
  end_x, end_y = end_cord.split(',').map(&:to_i)

  cords << [
    start_x, start_y,
    end_x, end_y
  ]

  max_x = [max_x, start_x, end_x].max
  max_y = [max_y, start_y, end_y].max
end

map = Array.new(max_y + 1) { Array.new(max_x + 1, 0) }

cords.each do |cord|
  start_x, start_y, end_x, end_y = cord

  if start_x == end_x
    if start_y < end_y # up
      start_y.upto(end_y) do |y|
        map[y][start_x] += 1
      end
    else # down
      end_y.upto(start_y) do |y|
        map[y][start_x] += 1
      end
    end
  elsif start_y == end_y
    if start_x < end_x
      start_x.upto(end_x) do |x|
        map[start_y][x] += 1
      end
    else
      end_x.upto(start_x) do |x|
        map[start_y][x] += 1
      end
    end
  else
    x_dia = 1
    y_dia = 1

    x_dia = -1 if start_x > end_x
    y_dia = -1 if start_y > end_y

    ([(start_x - end_x).abs, (start_y - end_y).abs].max + 1).times do |index|
      map[start_y + index * y_dia][start_x + index * x_dia] += 1
    end
  end
end

# pp map

min_2_overlaps = 0

map.each do |row|
  row.each do |col|
    min_2_overlaps += 1 if col > 1
  end
end

pp min_2_overlaps
