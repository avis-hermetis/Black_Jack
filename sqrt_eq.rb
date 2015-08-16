puts "Введите коэффициенты."
puts "Коэффициент а = "
a = gets.to_i
puts "Коэффициент b = "
b = gets.to_i
puts "Коэффициент c = "
c = gets.to_i
d = b**2 - 4 * a * c
if d > 0
	x1 = ( -b + Math.sqrt(d) ) / 2 * a
	x2 = ( -b - Math.sqrt(d) ) / 2 * a
	puts " D = #{d} 
 Корни : 
 x1 = #{x1} 
 x2 = #{x2}"
elsif d == 0
	x = -b / 2 * a
	puts " D = #{d} 
	Корень x = #{x}"
else
	puts "Корней нет"
end


