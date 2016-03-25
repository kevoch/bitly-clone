require 'csv'




array =  []
insert = []
file = CSV.open('urls.csv')
total = file.count
file.each do |row|
   # Url.connection.execute "INSERT INTO urls values (#{row})"
   array << row
end

# short_url = [*'0'..'9',*'A'..'Z',*'a'..'z'].sample(7).join

# total.times do |i|
#  insert.push(i,array[i][0],short_url,0,Time.now,Time.now)
# end

p array