class Character
	attr_accessor :position
	def initialize (init_position=room1)

		@position = init_position
		@inventory = []
	
	end
end

class Room1

	puts "You are in a dark room, there is a door in the North"
	self.move

	def move

		m = gets.chomp

		case m

		when "N"
			room2 = Room2.new
			character.position = room2 = Room2.new

		else
			puts "You cant move onto that direction"
			self.move
		end
		
	end

end

class Room2

	puts "There is still no light enough, but you see something shinning in the West"
	self.move

	def move

		m = gets.chomp

		case m

		when "W"	
			room3 = Room3.new
			character.position = room3
	
		when "S"
			character.position = room1
		else
			puts "You cant move onto that direction"
			self.move
		end
	end
end


class Room3
	puts "End... by now"
end


character = Character.new(Room1.new)

