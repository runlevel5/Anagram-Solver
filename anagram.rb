# Given a file containing one word per line, print out all the combinations of
# words that are anagrams; each line in the output should contain a set of
# input words that are anagrams of each other.  No word should appear in the
# output more than once.
#
# For added programming pleasure, find the longest words that are anagrams,
# and the set of anagrams containing the most words.

module Anagram
  @filename = 'wordlist.txt';
  @words ||= File.readlines(@filename).collect { |line| line.chomp.downcase }

  # Set filename to be read
  def self.filename=(filename)
    @filename = filename
  end

  # Extract anagrams from an array of words
  def self.extract_anagrams(words = @words)
    @words_by_anagram = words.uniq.inject(Hash.new []) do |anagrams, word|
      key = word.chars.sort.join

      # Group anagrams by sorted key
      anagrams[key] += [word]
      anagrams
    end

    # filter anagrams with size one
    @words_by_anagram.delete_if { |_, words| words.count == 1 }
  end

  # anagrams that is the longest
  def self.max_anagrams_lengths
    @words_by_anagram.max_by { |key, _| key.length }
  end

  # anagrams that contains most words
  def self.max_anagrams_count
    @words_by_anagram.max_by { |_, words| words.count }
  end

end