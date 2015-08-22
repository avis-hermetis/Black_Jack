abc = ("a".."z")
vowels_ar = %w(a e i o u) 
vowels_h= {} 

abc.each_with_index do |letter, index|

	vowels_h[letter] = [index + 1] if vowels_ar.include?(letter)
	
end
p vowels_h