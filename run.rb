#!/usr/bin/env ruby

require_relative './anagram'

# Driver
if ARGV.size == 1
  if File.exists?(ARGV.first.to_s)
    puts "Processing ...\n\n"
    Anagram.filename = ARGV.first.to_s
    anagram_set = Anagram.extract_anagrams

    anagram_set.each do |key, words|
      output = ''
      words.each do |word|
        output += word + ' '
      end
      output += "\n"
      puts output
    end


    puts "\n\nThe longest words that are anagrams are: \n"
    output = ''
    max_anagrams_lengths = Anagram.max_anagrams_lengths
    max_anagrams_lengths.last.each do |word|
      output += word + ' '
    end
    output += "\nwith #{max_anagrams_lengths.first.length} characters."
    puts output


    puts "\n\nThe set of anagrams the contain most words are: \n"
    output = ''
    max_anagrams_counter = Anagram.max_anagrams_count
    max_anagrams_counter.last.each do |word|
      output += word + ' '
    end
    output += "\nwith #{max_anagrams_counter.last.count} occurences.\n"

    puts output
  else
    puts 'File not found'
  end
else
  puts "Usage:\n  run.rb FILENAME"
end
