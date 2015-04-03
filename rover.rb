##Rover
# We store state in instance variables in the initialize method.



class Rover
	def initialize (init_x, init_y, init_direction) ##State!!
		@x = init_x
		@y = init_y
		@direction = init_direction
	end

		#Behavioiur
	def move_forward
		if @direction == "N"
			@y = @y + 1
		elsif @direction == "E"
			@x = @x + 1
		elsif @direction == "S"
			@y = @y - 1
		elsif @direction == "W"
			@x = @x - 1
		end	
	end
	
	def turn_left

		if @direction == "N"
			@direction = "W"

		elsif @direction == "W"
			@direction = "S"

		elsif @direction == "S"
			@direction = "E"

		elsif @direction == "E"
			@direction = "N"

		end
	end
	
	def turn_right

		if @direction == "N"
			@direction = "E"
		elsif @direction == "W"
			@direction = "N"
		elsif @direction == "S"
			 @direction = "W"
		elsif @direction == "E"
			 @direction = "S"	
		end
	end

	def read_instruction(machine)

		puts "Where do you want me to go?"
		@user_input = gets.chomp
		
		if @user_input == "L"
			machine.turn_left
		elsif @user_input == "R"
			machine.turn_right
		elsif @user_input == "M"
			machine.move_forward
		end	

	end

	def to_s #this is what my Rover looks like when its turned into a string
		puts "I am at #{@x}, #{@y}, facing #{@direction}"
	end
end

my_rover = Rover.new(1, 2, "N") #pass parameters into new 
my_rover.to_s
my_rover.read_instruction(my_rover)
my_rover.to_s

#puts my_rover 
#my_rover.move_forward
#puts my_rover
#my_rover.turn_left
#puts my_rover

## Look up the split method

## Domain mdoeling
# 1. What are the things?
# 2. WHow
