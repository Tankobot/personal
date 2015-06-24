a = {}
en = io.read()
lim=io.read()-en+1

for i=1, lim do
    a[i]=en+i-1
end

for i=lim, 2, -1 do 
    j = math.random(1, i)
    b = a[j]
    a[j] = a[i]
    a[i] = b
end

for i=1,#a do
    if i==a[i] then
        repeat
            j=math.random(1,#a)
        until j~=i
        b=a[j]
        a[j]=a[i]
        a[i]=b
    end
end

file = io.open("seq.dat")

for i=1,#a do 
	file:write(a[i])
	file:flush()
    print(a[i],i==a[i])
end

file:close()