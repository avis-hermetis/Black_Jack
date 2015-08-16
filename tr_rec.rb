puts "Введите три стороны треугольника."
puts "Введите сторону a:"
a = gets.to_f
puts "Введите сторону b:"
b = gets.to_f
puts "Введите сторону c:"
c = gets.to_f
sides = [a, b, c].sort
if sides[2]**2 == sides[0]**2 + sides[1]**2
	rec = true
elsif a == b || b == c || c == a
    isosceles = true
end
puts "Это прямоугольный треугольник" if rec 
puts "Это НЕ прямоугольный треугольник." unless rec
puts "К тому же, он ранобедренный." if isosceles
