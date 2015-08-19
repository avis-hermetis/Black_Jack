
puts "Ввод информации о товаре производится 
до момента ввода пользователем команды 'стоп' "
cart = Hash.new
sum = Hash.new
 total_sum = 0.0
 
while true

puts "Введите название товара"
goods = gets.chomp.downcase
 if goods == "стоп" 
		break
 else
 puts "Введите цену товара" 
 price = gets.chomp.to_f

 puts "Введите количество товара"
 number = gets.chomp.to_f

 sum[goods] = [price * number]
  cart[goods] = { :цена => price, :кол_во => number}

 total_sum += price * number

 end
end

puts "Корзина покупателя: #{cart}"
sum.each do |key, value|
	puts "Суммарная стоимость #{key} ---- #{value}"
		end

puts "Общая стоимость корзины: #{total_sum}"
