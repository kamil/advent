# frozen_string_literal: true

lines = File.open("#{__dir__}/input.txt").readlines
lines2 = lines.dup

line_width = lines.first.size - 1

line_width.times do |i|
  row = lines.map do |line|
    line[i].to_i
  end

  in_row0 = row.count(0)
  in_row1 = row.count(1)

  most_common = if in_row0 == in_row1
                  1
                else
                  in_row0 > in_row1 ? 0 : 1
                end

  lines = lines.select { |line| line[i] == most_common.to_s }

  next unless lines2.size != 1

  row2 = lines2.map do |line|
    line[i].to_i
  end

  in_row20 = row2.count(0)
  in_row21 = row2.count(1)

  least_common = if in_row20 == in_row21
                   0
                 else
                   in_row20 > in_row21 ? 1 : 0
                 end

  lines2 = lines2.select { |line| line[i] == least_common.to_s }
end

oxygen_generator_rating = lines[0].to_i(2)
co2_scrubber_rating = lines2[0].to_i(2)

puts oxygen_generator_rating, co2_scrubber_rating, oxygen_generator_rating * co2_scrubber_rating
