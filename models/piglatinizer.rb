class PigLatinizer

	attr_accessor :text

	def initialize

	end

	def convert(text)

		cutoff = 0
		result = ""

		while !(text[cutoff].match(/[aeiouAEIOU]/)) do
		
			cutoff += 1
		
		end

		if cutoff == 0
			result = "#{text}way"
		else
			result = "#{text}#{text[0...cutoff]}ay"
			result = result[cutoff..-1]
		end
		result
	end

	def split_to_words(text)
		text.split(' ')
	end

	def merge_back(array)
		array.join(" ")
	end

	def piglatinize(text)
		@text = text
		array = split_to_words(text)
		array = array.map do |word|
			convert(word)
		end
		merge_back(array)
	end
end