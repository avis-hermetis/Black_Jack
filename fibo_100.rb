array_5step = Array.new(1)
z = 0
i = 1
j = 1
while j <= 100 do 
array_5step.push(j)
j = z + i
z = i
i = j
end
puts array_5step