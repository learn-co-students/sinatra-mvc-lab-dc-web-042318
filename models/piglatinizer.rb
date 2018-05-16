class PigLatinizer
  attr_accessor :text, :piglatinize

  @@vowels = ['a', 'e', 'i', 'o', 'u']

  def initialize(text_input)
    @text = text_input
    words_list = split_words(text)
    first_vowels = find_first_vowel(words_list)
    @piglatinize = latinize(first_vowels)
  end

  def split_words(sentence)
    sentence.split(' ')
  end

  def find_first_vowel(array)
    result = []
    array.each do |word|
      word_hash = {}
      first_vowel = word.chars.each_with_index.map{ |c, i| i if @@vowels.include?(c.downcase) }.compact.first
      word_hash[word] = first_vowel
      result << word_hash
    end
    result
  end

  def latinize(words)
    result = []
    words.each do |word|
      word.each do |key, value|
        if @@vowels.include?(key.chars.first.downcase) || key.length == 1
          result << "#{key}way"
        else
          split_word = key.chars
          first_letters = split_word.slice!(0..(value - 1))
          split_word << first_letters
          result << "#{split_word.join}ay"
        end
      end
    end
    result.join(' ')
  end
end