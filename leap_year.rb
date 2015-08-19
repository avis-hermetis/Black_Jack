puts "Введите ваш год рождения"
year = gets.chomp.to_i
puts "Ведите дату вашего рождения (например 15 февраля)"
date = gets.chomp.split
month = date[1].downcase
day = date[0].to_i
if month == "января" 
      month = 1
elsif month == "февраля" 
	  month = 2
elsif month == "марта" 
	  month = 3
elsif month == "апреля" 
	  month = 4
elsif month == "марта" 
	  month = 5
elsif month == "июня" 
	  month = 6
elsif month == "июля" 
	  month = 7
elsif month == "августа" 
	  month = 8
elsif month == "сентября" 
	  month = 9
elsif month == "октября" 
	  month = 10
elsif month == "ноября" 
	  month = 11
elsif month == "декабря" 
	  month = 12
else puts "Вы неправильно ввели дату"
end
if (year % 4 == 0 && year % 100 == 0) || (year % 400 == 0)
	leap = true 
else
	leap = false
end
days_in_month = {1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31}

days_sum = 0
i = 1
until i > month - 1 do 
	days_sum = days_sum + days_in_month[i]
	i += 1
end

days_sum += day

if month > 2 && leap == true
	days_sum += 1
end
puts days_sum
