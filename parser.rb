require 'debug'

class CimpParser
  def self.parse(file = 'files/TEST_FBL_0702.txt')
    return puts 'Sorry, the file was not found' unless File.exist?(file)

    arr_lines = File.open(file, 'r') { |f| f.to_a.map!(&:chomp) }
    flight_params = arr_lines[1].split("/")

    airbills = []
    arr_lines.map { |line| airbills << line if line.split("-").size == 2 }

    print_report(arr_lines, flight_params, airbills)
  end

  def self.print_report(arr_lines, flight_params, airbills)
    puts 'Flight params:'
    puts "ID Flight - #{flight_params[0]}"
    puts "Flight No - #{flight_params[1]}"
    puts "Date Flight - #{flight_params[2]}"
    puts "Departure - #{flight_params[3]}"
    puts "Destination - #{arr_lines[2]}"
    puts "Aircraft Registration - #{flight_params[4]}"
    puts
    puts

    airbills.each do |bill|
      puts "airbill number - " + bill.split("/")[0]
      puts "weight - " + bill.split("/")[1].split(".").last
      puts "seat number - " + bill.split("/")[1].split(".")[1]
      puts
    end
  end
end

CimpParser.parse
