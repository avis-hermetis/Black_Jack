abc = ("a".."z")  # range букв в алфавите
vowels_ar = %w(a e i o u) #массив гласных 
vowels_h= {} # в этом хэшэ будут находится порядковые номера гласных в алфавите по типу: гласная => порядковый номер

abc.each_with_index do |letter, index|  # перебор буквенного массива с индексацией

	vowels_h[letter] = [index + 1] if vowels_ar.include?(letter) 
	
end
p vowels_h #вывод хэша гласных с порядковым омером в алфавите