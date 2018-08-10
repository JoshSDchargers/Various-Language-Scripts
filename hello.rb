class Hello

def loop()
idarray=[]
listarray=[]
lastarray=[]
firstarray=[]
majorarray=[]
yeararray=[]
while true 
  puts "\n\nStudent Database"
  puts "---------------------------------"
  puts "1) Insert new record to database"
  puts "2) Modify record in database"
  puts "3) Remove record from databases"
  puts "4) Display record(s) in database"
  puts "5) Quit"
  puts "Enter an choice:"
  output = gets.chomp
case output
    when "1"
    myarray=insert()
        listarray << myarray
        idarray << myarray[0]
        lastarray << myarray[1]
        firstarray << myarray[2]
        majorarray << myarray[3]
        yeararray << myarray[4]
            puts listarray
    when "2"
	 temparray =modify(idarray, lastarray, firstarray, majorarray, yeararray)
        puts temparray[5]
            listarray[temparray[5]]= [temparray[0], temparray[1], temparray[2], temparray[3], temparray[4]]
            lastarray[temparray[5]] = [temparray[1]]
            firstarray[temparray[5]]= [temparray[2]]
            majorarray[temparray[5]] = [temparray[3]]
            yeararray[temparray[5]] = [temparray[4]]
    when "3"
        count=remove(idarray)
	listarray.delete_at(count)
	lastarray.delete_at(count)
	firstarray.delete_at(count)   
	majorarray.delete_at(count)
	yeararray.delete_at(count)  

    when "4"
        display(listarray)
    when "5"
        quit()
    end
 end
return myarray
end

def insert()
  puts "Enter Student ID:"
	id = gets
  puts "Enter last name"
	last = gets
  puts "Enter first name"
	first = gets
  puts "Enter major"
	major = gets
  puts "Enter catalog year:"
	year = gets
myarray = [ id, last, first, major, year ]
return myarray
 end
end






def modify(idarray, lastarray, firstarray, majorarray, yeararray)
puts "\n\nEnter Student ID:"
check = gets
    idarray.length.times do |i|
        if idarray[i] == check
            count = i
            puts count
            idhold = idarray[i]
            puts "Modify last name"
                puts "\tCurrent value: #{lastarray[i]}"
                puts "\tNew value:"
                    newlast= gets
            puts "Modify first name"
                puts "\tCurrent value: #{firstarray[i]}"
                puts "\tNew value:"
                    newfirst = gets
            puts "Modify major:"
                puts "\tCurrent name: #{majorarray[i]}"
                puts "\tNew value:"
                    newmajor = gets
            puts "Modify catalog year"
                puts "\tCurrent value: #{yeararray[i]}"
                puts "\tNew value:"
                    newyear = gets
              return idhold , newlast , newfirst, newmajor, newyear, count
        end
    end
end











def remove(idarray)
puts "\n\nEnter Student ID to remove:"
     number = gets
            idarray.length.times do |i|
                 if idarray[i] == number
                     count = i
                        return count
                 end
            end
        end

def display(listarray)
puts "\n\n----------------------------------------------------------------------"
puts " ID       | Last name     | First name        |Major      | year"
puts "-----------------------------------------------------------------------"
listarray.each do |listarray|
    puts "#{listarray}"
    end
end


def quit()
 puts "working"
 end
    

def quit
end

c = Hello.new
c.loop()













