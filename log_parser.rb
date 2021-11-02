# frozen_string_literal: true

class LogParser
  def initialize(file_path)
    @file_path = file_path
    @visited = Hash.new { |hash, key| hash[key] = []  }
    @unique = Hash.new { |hash, key| hash[key] = Set.new  }
  end

  def call
    content = File.read(file_path)
    content.split("\n").each do |line|
      path_and_ip = line.split(' ')

      visited[path_and_ip.first] << path_and_ip.last
      unique[path_and_ip.first] << path_and_ip.last
    end

    visited.transform_values! { |value| value.size }
    unique.transform_values! {  |value| value.size }

    puts "visited paths"
    visited
      .sort_by { |key, value| -value }
      .each { |key, value| print "#{key}:#{value}" }
    puts "\n"
    puts 'unique paths'
    unique
      .sort_by { |key, value| -value }
      .each { |key, value| print "#{key}:#{value}" }
  end

  attr_reader :file_path, :visited, :unique 
end
