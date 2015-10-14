require 'pry'
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
	attr_accessor :position_row, :position_column, :map, :inventory

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
		@door = "closed"
		@wolves = "alive"
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
			puts "The fire you saw on the east disapears"
			puts "Red eyes are watching you from the darkness, you think that you may be surrounded by wolves."
			puts "It seems pretty dangerous"
			puts "Suddenly, you see a bed in the North"
			self.move
		end

		if @character.map.world[@character.position_row][@character.position_column] == 5
			#system "clear"
			puts "You go to bed. Next morning you wake up. It was all a dream, and now it's finished"
			puts "Congratulations, you found the Exit"
			puts "GAME OVER"
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
		#binding pry

		if @wolves == "alive"
		if @character.map.world[@character.position_row][@character.position_column] == 4
				puts "The wolves surround you. If you can't do anything they are going to eat you"
				print "> "
				@movement = gets.chomp
				@movement.downcase!

				if @movement.include? "fight"
			
					if @character.inventory.include? "Sword"
						@wolves = "dead"
						puts "Rapidly you take the rusty Sword that you have taken before."
						puts "You fight the wolves as a professional. In a few minutes you have beaten most of them. The rest of the pack is runing away."
						puts "You feel there is no more danger in here. Now you can go on!"
						self.actual_pos
					else
						puts "you can't fight a pack of wolves with your bare hands"
						puts "The wolves bite you with cruelty. You cry in pain as everything goes black"
						puts "GAME OVER"
						exit(0)
					end
				
				elsif @movement == "cry"
					puts "you can't fight a pack of wolves with your tears"
					puts "The wolves bite you with cruelty. You cry in pain as everything goes black"
					puts "GAME OVER"
					exit(0)
				
				else
				puts "You don't know how to react, but the wolves do."
				puts "The wolves bite you with cruelty. You cry in pain as everything goes black"
				puts "GAME OVER"
				exit (0)
				end
		end
		end

		if @movement == "n"

			if @character.map.world[@character.position_row][@character.position_column] == 1
				if @door == "closed"
					puts "The door is closed, you can't go out of the room"
					self.actual_pos
				end
			end

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

		elsif @movement == "inventory"
			if @character.inventory.length > 0
				puts "Your inventory consist on:"
				@character.inventory.each do |item|
					puts "- #{item}"
				end
			else
				puts "your inventory is empty" 
			end
			self.actual_pos

		elsif @movement == "search"

			if @character.map.world[@character.position_row][@character.position_column] == 1
				puts "There is a key in the ground"
			elsif @character.map.world[@character.position_row][@character.position_column] == 2
				puts "there is a rusty Sword on the wall"		
			elsif @character.map.world[@character.position_row][@character.position_column] == 3
				puts "A cold wind blows, you hear some wolves howling near your position, but you can't find anything useful"			
			elsif @character.map.world[@character.position_row][@character.position_column] == 4
				puts "You don't find anything useful, but the wolves are really near. You sense the danger in your skin and the fear in your brain"		
			else
				puts "There's nothing here you can use"
			end
			self.actual_pos	

		elsif @movement.include? "take"
			if @character.map.world[@character.position_row][@character.position_column] == 1
				puts "You take the key of the ground"
				@character.inventory.push "Key"

			elsif @character.map.world[@character.position_row][@character.position_column] == 2
				puts "You take the rusty Sword from the wall"
				@character.inventory.push "Sword"
			else
				puts "There's nothing to pick here"
			end	
			self.actual_pos

		elsif @movement.include? "pick up"
			if @character.map.world[@character.position_row][@character.position_column] == 1
				puts "You take the key of the ground"
				@character.inventory.push "Key"

			elsif @character.map.world[@character.position_row][@character.position_column] == 2
				puts "You take the rusty Sword from the wall"
				@character.inventory.push "Sword"
			else
				puts "There's nothing to pick here"
			end	
			self.actual_pos

		elsif @movement.include? "open"
			
			if @door == "closed"

				if @character.inventory.include? "Key"
					@door = "open"
					puts "You opened the door"
				else
					puts "you don't have a key to open the door"
					
				end
			else
				if @character.inventory.include? "Key"
					@door = "closed"
					puts "You closed the door"
				else
					puts "you don't have a key for this door"
					self.actual_pos
				end
			end
			self.actual_pos

		else
			puts "I don't understand, try another thing"
			self.actual_pos
		end	
	end

end

game = Game.new
