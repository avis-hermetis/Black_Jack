a = ("a".."z").to_a
h = Hash.new
i = 1
while i <= a.size do
    h[ a[i - 1] ] = i
	i += 1
	end
	h.each do |key, value|
		puts "#{key} => #{value}"
	end