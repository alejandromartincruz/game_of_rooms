class World
	attr_accessor :world
	def initialize
		@world = [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,5,0],[0,2,3,4,0],[0,1,0,0,0]]
	end
	
	def show_pos	
		i=0
		@world.each do |step|
			print "#{world[i]}\n"
			i = i+1
		end
	end
end


class Character
	attr_accessor :position_row, :position_column, :map

	def initialize
		@position_row = 4
		@position_column = 1
		@inventory = []
		@map= World.new
		@movement
	end

	def set_position
		puts "You are in row: #{@position_row} anr column: #{@position_column}"
		#@map.world[@position_row][@position_column] = 1
		#@map.show_pos

	end
end

class Game

	def initialize
		@character = Character.new
		self.actual_pos
	end

	def actual_pos
		if @character.map.world[@character.position_row][@character.position_column] == 1
			#system "clear"
			puts "You are in a dark room, you see a door in the North side of the room"
			self.move
		end

		if @character.map.world[@character.position_row][@character.position_column] == 2
			#system "clear"
			puts "You are in a dark corridor, it seems that there is a door in the East"
			self.move
		end

		if @character.map.world[@character.position_row][@character.position_column] == 3
			#system "clear"
			puts "Now you are in the woods. It seems that it's midnight. You can see a fire in the East"
			self.move
		end

		if @character.map.world[@character.position_row][@character.position_column] == 4
			#system "clear"
			puts "You are walking throug the dark wood and a red dragon ambush you."
			puts "Don't be silly, the dragons don't exist. A fairy told me that."
			puts "Suddenly, you see a bed in the North"
			self.move
		end

		if @character.map.world[@character.position_row][@character.position_column] == 5
			#system "clear"
			puts "You go to bed. Next morning you wake up. It was all a dream, and now it's finished"
			puts "Congratulations, you found the Exit"
			exit(0)
		end


	end

	def future_pos
		if @movement == "n"
			if @character.position_row == 0 
				puts "cant move that direction"
				self.actual_pos
			elsif
				@character.position_row += -1
				if @character.map.world[@character.position_row][@character.position_column] == 0
					puts "cant move that direction"
					@character.position_row += 1
					self.actual_pos
				end
				@character.position_row += 1
			else
			end

		elsif @movement =="s"

			if @character.position_row == 4 
				puts "cant move that direction"
				self.actual_pos
			elsif
				@character.position_row += 1
				if @character.map.world[@character.position_row][@character.position_column] == 0
					puts "cant move that direction"
					@character.position_row += -1
					self.actual_pos
				end
				@character.position_row += -1
			else
			end

		elsif @movement == "e"

			if @character.position_column == 4 
				puts "cant move that direction"
				self.actual_pos
			elsif
				@character.position_column += 1
				if @character.map.world[@character.position_row][@character.position_column] == 0
					puts "cant move that direction"
					@character.position_column += -1
					self.actual_pos
				end
				@character.position_column += -1
			else
			end

		elsif @movement == "w"

			if @character.position_column == 0 
				puts "cant move that direction"
				self.actual_pos
			elsif
				@character.position_column += -1
				if @character.map.world[@character.position_row][@character.position_column] == 0
					puts "cant move that direction"
					@character.position_column += 1
					self.actual_pos
				end
				@character.position_column += 1
			else
			end

		else
		end

	end

	def move
		print "> "
		@movement = gets.chomp
		@movement.downcase!
		if @movement == "n"
			self.future_pos
			@character.position_row += -1
			#@character.set_position
			self.actual_pos

		elsif @movement =="s"
			self.future_pos
			@character.position_row += 1
			#@character.set_position
			self.actual_pos

		elsif @movement == "e"
			self.future_pos
			@character.position_column += 1
			#@character.set_position
			self.actual_pos

		elsif @movement == "w"
			self.future_pos
			@character.position_column -= 1
			#@character.set_position
			self.actual_pos

		else
			puts "I don't understand, try another thing"
			self.actual_pos
		end	
	end

end

game = Game.new
