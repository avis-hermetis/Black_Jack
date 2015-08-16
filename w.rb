puts "Как ваше имя?"
name = gets.chomp
puts "Каков ваш рост, #{name}?"
weight = gets.chomp
if weight.to_i - 110 < 0 
	puts "#{name}, ваш вес уже оптимальный!"
else 
	puts "#{name}, вам бы не помешало немного скинуть."
end