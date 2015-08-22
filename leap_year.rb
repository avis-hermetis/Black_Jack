puts "Введите ваш год рождения"
year = gets.chomp.to_i
puts "Ведите дату вашего рождения (например 15 февраля)"
date = gets.chomp.split
month = date[1].downcase   
day = date[0].to_i       

months_hash = {
	января: 1, февраля: 2, марта: 3, апреля: 4, мая: 5, июня: 6, 
	июля: 7, августа: 8, сентября: 9, октября: 10, ноября: 11, декабря: 12
}   #хэш типа: месяц => порядковый номер месяца                                  


if (year % 4 == 0 && year % 100 == 0) || (year % 400 == 0) #является ли год високосным
	leap = true 
else
	leap = false
end
days_in_month = {1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31}
# количество дней в месяце

days_sum = 0
i = 1
until i > months_hash[month.to_sym] - 1 do 
	days_sum = days_sum + days_in_month[i]
	i += 1
end

days_sum += day

if month.to_i > 2 && leap == true
	days_sum += 1
end
puts days_sum
