class Person
	def initialize(name)
		@name = name
	end

	def print_name	
		puts "Hi! My name is #{@name}!"
	end
end


class Student < Person
 	def learn
 		puts "I get it!"
 	end
end

class Instructor < Person
 	def teach
 		puts "Everything in Ruby is an Object!"
 	end
end

i = Instructor.new("Chris")
i.print_name




# Create an instance of an object to save it s = Person.new("")

