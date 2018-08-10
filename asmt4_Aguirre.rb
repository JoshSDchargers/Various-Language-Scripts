class Hello

def loop()
idarray=[]
listarray=[]
lastarray=[]
firstarray=[]
majorarray=[]
yeararray=[]
clist=[]
open(idarray,lastarray, firstarray, majorarray, yeararray, listarray, clist )
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
    myarray=insert(idarray)
	if myarray != "42069"
       	 holdlist = [myarray[0] +"," +myarray[1]+ ":" + myarray[2] + ":" + myarray[3] + ":" + myarray[4]]
       	 	clist << holdlist
		listarray << myarray
        	idarray << myarray[0]
        	lastarray << myarray[1]
        	firstarray << myarray[2]
        	majorarray << myarray[3]
        	yeararray << myarray[4]
	end
    when "2"
	 	temparray =modify(idarray, lastarray, firstarray, majorarray, yeararray)
		
if temparray[6] == "yes"
            holdlist = [temparray[0] +"," +temparray[1]+ ":" + temparray[2] + ":" + temparray[3] + ":" + temparray[4]]
	    clist[temparray[5]] = [holdlist]
		clist.flatten	
            listarray[temparray[5]]= [temparray[0], temparray[1], temparray[2], temparray[3], temparray[4]]
            	lastarray[temparray[5]] = [temparray[1]]
            	firstarray[temparray[5]]= [temparray[2]]
           	 majorarray[temparray[5]] = [temparray[3]]
            	yeararray[temparray[5]] = [temparray[4]]
end
    when "3"
        count=remove(idarray)
	idarray.delete_at(count)
	listarray.delete_at(count)
	lastarray.delete_at(count)
	firstarray.delete_at(count)   
	majorarray.delete_at(count)
	yeararray.delete_at(count)
	clist.delete_at(count)  

    when "4"
        display(listarray)
    when "5"
        quit(clist)
    end
 end
return myarray
end


def insert(idarray)
  puts "Enter Student ID:"
	id = gets.chomp!
 idarray.length.times do |i|
        if idarray[i] == id
	puts "Id already exitst!!"
return "42069"
Exit
end
end
  puts "Enter last name"
	last = gets.chomp!
  puts "Enter first name"
	first = gets.chomp!
  puts "Enter major"
	major = gets.chomp!
  puts "Enter catalog year:"
	year = gets.chomp!
myarray = [ id, last, first, major, year ]
return myarray
 end
end






def modify(idarray, lastarray, firstarray, majorarray, yeararray)
puts "\n\nEnter Student ID:"
check = gets.chomp! 
    idarray.length.times do |i|
        if idarray[i] == check
            count = i
            idhold = idarray[i]
            puts "Modify last name"
                puts "\tCurrent value: #{lastarray[i]}"
                puts "\tNew value:"
                    newlast= gets.chomp!
            puts "Modify first name"
                puts "\tCurrent value: #{firstarray[i]}"
                puts "\tNew value:"
                    newfirst = gets.chomp!
            puts "Modify major:"
                puts "\tCurrent name: #{majorarray[i]}"
                puts "\tNew value:"
                    newmajor = gets.chomp!
            puts "Modify catalog year"
                puts "\tCurrent value: #{yeararray[i]}"
                puts "\tNew value:"
                    newyear = gets.chomp!
              return idhold , newlast , newfirst, newmajor, newyear, count , "yes"
        end
    end
end





def remove(idarray)
puts "\n\nEnter Student ID to remove:"
     number = gets.chomp!
            idarray.length.times do |i|
                 if idarray[i] == number
                     count = i
                        return count
                 end
            end
        end

def display(listarray)
puts "\n\n--------------------------------------------------------------------"
puts " ID       | Last name     | First name        |Major      | year"
puts "---------------------------------------------------------------------"
listarray.each do |listarray|
    puts "#{listarray}"
    end
end


def quit(clist)
 	puts "quitting....."
	puts "Do you want to save content (y/n):"
        	answer=gets.chomp
if answer == 'y'
	save(clist)
    end
Kernel::exit

 end

def save(clist)
File.open('results.txt', "w+") do |f|
  f.puts(clist)
end
end

def open(idarray,lastarray, firstarray, majorarray, yeararray, listarray, clist)
array= []
arrayone=[]
   puts "Enter database for students"
data= gets.chomp
     File.open(data).readlines.each do |line|
     array << line
  end

array.length.times do |i|
        listarray << array[i]
		arrayone=array[i].split(/\s*[,:]\s* |\s{2,}|[\r\n]+ /x)
		puts arrayone[1]
		hold= [arrayone[0] +"," +arrayone[1]+ ":" + arrayone[2] + ":" + arrayone[3] + ":" + arrayone[4]]
		clist[i] = [hold]
       	 	idarray << arrayone[0]
        	lastarray << arrayone[1]
        	firstarray << arrayone[2]
        	majorarray << arrayone[3]
       		yeararray << arrayone[4]

	end
end


c = Hello.new
c.loop()




















