require 'csv'

def clean_zipcode(zipcode)
  if zipcode.to_s.length == 0
  	zipcode = "00000"
  elsif zipcode.to_s.length < 5  	
  	i = 0
  	while zipcode.to_s.length < 5
  	  zipcode = "0" + zipcode
  	  i +=1
  	end
  	return zipcode
  elsif zipcode.to_s.length > 5
  	zipcode = zipcode[0..4]
  else
  	return zipcode
  end
end 

puts "EventManager Initialized!"

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

contents.each do |row|
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])

  puts "#{name} : #{zipcode}"
end