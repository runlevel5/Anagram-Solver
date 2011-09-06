require 'anagram'

describe "Anagram.extract_anagrams" do
  context "given two strings that are duplicated of each other" do
    it 'returns a hash of anagrams with value that contains no duplication' do
      input = %w{ god god dog}
      Anagram.extract_anagrams(input).should == {"dgo"=>["god", "dog"]}
    end
  end

  context 'given a set of words' do
    it 'returns a hash of words that is anagram of each other' do
      input = %w{ god dog maly toro }
      Anagram.extract_anagrams(input).should == {"dgo"=>["god", "dog"]}
    end
  end

  context 'given one string' do
    it 'returns a empty hash' do
      input = %w{ god }
      Anagram.extract_anagrams(input).should == {}
    end
  end
end if Anagram.respond_to? :extract_anagrams


describe "Anagram.max_anagrams_lengths" do
  context "given a set of words" do
    it 'returns an array with first element is the char length and second is is array of the longest anagrams' do
      input = %w{ pares parse pears rapes reaps spare spear dog god algorithmically logarithmically }
      Anagram.extract_anagrams(input)
      Anagram.max_anagrams_lengths.should == ["aacghiilllmorty", ["algorithmically", "logarithmically"]]
    end
  end
end if Anagram.respond_to? :max_anagrams_lengths


describe "Anagram.max_anagrams_count" do
  context "given a set of words" do
    it 'returns the anagram set that has most words' do
      input = %w{ pares parse pears rapes reaps spare spear dog god }
      Anagram.extract_anagrams(input)
      Anagram.max_anagrams_count.should == ["aeprs", ["pares", "parse", "pears", "rapes", "reaps", "spare", "spear"]]
    end
  end
end if Anagram.respond_to? :max_anagrams_count