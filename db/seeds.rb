require_relative '../app/models/url'
require 'csv'

# class UrlImporter
#  def self.import(filename)
#    array =  []
#    insert = []
#    file = CSV.open(filename)
#    total = file.count
#    file.each_line do |row|
#       # Url.connection.execute "INSERT INTO urls values (#{row})"
#       array << row
#    end

#    short_url = [*'0'..'9',*'A'..'Z',*'a'..'z'].sample(7).join

#    total.times do |i|
#     insert.push(i,array[i][0],short_url,0,Time.now,Time.now)
#    end

#    sql = "INSERT INTO urls ('id','long_url','short_url','click_count','created_at','updated_at') VALUES #{insert.join(",")}"

#  end  


# # inserts = []
# # csv = CSV.open(filename)
# # total = csv.count
# # total.times do
   






# end





class UrlsImporter
def self.import
  csv = File.open(APP_ROOT.join("db","urls.txt"))
  Url.transaction do
       csv.each_line do |row|
         # Url.create(long_url: row[1..-4]) 
          Url.connection.execute "INSERT INTO urls (long_url) VALUES ('#{row[1..-4]}')"
         
       end
   end
end
end
UrlsImporter.import