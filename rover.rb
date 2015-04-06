##Rover
# We store state in instance variables in the initialize method.



module RoverProcess
	def process_commands(commands)
		commands.split("").each do |command|
			case command
				when "M"
					move_forward
				when "R"
					turn_right
				when "L"
					turn_left
			
			end
		end
	end
end

class Rover

	attr_accessor :x, :y, :direction

	def initialize (init_x, init_y, init_direction) ##State!!
		@x = init_x
		@y = init_y
		@direction = init_direction
	end

	include RoverProcess
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
		else
			puts "Error!"	
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
		else 
			puts "Error!"	

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
		else
			puts "Error!"
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

class Plateau

	def initialize (width, height)
		@width = width
		@height = height
		@rovers = []
	end	

	include RoverProcess

 	def ask_for_size
 		puts "How big should the plateau be?"
 		@size = gets.chomp
	end	
	
	def materialize_rover(x, y, direction)
		if x > @width or x < 0 or y > @height or y < 0
			puts "GET YOUR SHIT TOGETHER. THIS IS NOT EVEN ON THE PLATEAU, YO."
		else
			new_rover = Rover.new(x, y, direction)
			@rovers << new_rover
		end	
	end	

	def choose_rover
		puts "Which rover do you want to command?"
		puts "Enter '1' for Rover 1"
		puts "Enter '2' for Rover 2"
		user_input = gets.chomp.to_i

		puts "Where do you want your rover to go?"
		puts "Write 'L' to turn left"
		puts "Write 'R' to turn right"
		puts "Write 'M' to move forward"
		puts "For example, MLLLMMMM"

		commands = gets.chomp
		@rovers[user_input - 1].process_commands(commands)
	end	

	def to_s 
		"Plateau width: #{@width}, height: #{@height}, Rovers: \n\n#{@rovers.map{|r| r.to_s}}"
	end	

end		

plateau = Plateau.new(10,10)
plateau.materialize_rover(1, 2, "N")
plateau.materialize_rover(3, 3, "E")
puts plateau
plateau.choose_rover
puts plateau
plateau.choose_rover
puts plateau

# my_rover = Rover.new(1, 2, "N") #pass parameters into new 
# my_rover.to_s
# my_rover.read_instruction(my_rover)
# my_rover.to_s

## From breakout session
#puts my_rover 
#my_rover.move_forward
#puts my_rover
#my_rover.turn_left
#puts my_rover

## Look up the .split method

## Domain mdoeling
# 1. What are the things?
# 2. WHow
