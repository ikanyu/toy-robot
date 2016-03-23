require 'byebug'

class Robot

	def initialize
		@board = Array.new(5) { Array.new(5) }	
		@direction = ['NORTH', 'EAST', 'SOUTH', 'WEST']
		in_game
	end

	def in_game
		file = ARGV.first

		text = File.open(file).each_line do |line|
			data = line.split('\n')

			input = data[0]
			puts input
			input = input.split(' ')
			details = input[1].split(',') unless input[1].nil?

			case input[0]
			when 'PLACE'
				@current_position = [details[0].to_i, details[1].to_i]
				@current_direction = details[2]			
			when 'LEFT'
				left
				report
			when 'RIGHT'
				right
				report
			when 'REPORT'
				report
			when 'MOVE'
				move
				report
			else
				puts 'hi'			
				break
			end
		end
	end

	def convert_coordinate(x,y)
		new_x = (y-4).abs
		new_y = x
		@current_position = [x,y]
	end

	def left
		unless @direction.nil?
			position = @direction.find_index(@current_direction)
			@current_direction = @direction[position - 1]
		end
	end

	def right
		unless @direction.nil?
			position = @direction.find_index(@current_direction)
			position == 3 ? @current_direction = @direction[0] : @current_direction = @direction[position + 1]
		end
	end

	def move
		unless @direction.nil?
			if @current_direction ==  'NORTH'
				@current_position = [@current_position[0], @current_position[1] + 1] unless check_north_danger
			elsif @current_direction == 'EAST'
				@current_position = [@current_position[0] + 1 , @current_position[1]] unless check_east_danger
			elsif @current_direction == 'SOUTH'
				@current_position = [@current_position[0], @current_position[1] - 1] unless check_south_danger
			elsif @current_position == 'WEST'
				@current_position = [@current_position[0] - 1, @current_position[1]] unless check_west_danger
			else
				@current_position
			end	
		end
	end

	def report
		puts "#{@current_position[0]},#{@current_position[1]},#{@current_direction}" unless @current_position.nil?
	end

	def check_north_danger
		true if @current_position[1] == 4
	end

	def check_south_danger
		true if @current_position[1] == 0
	end

	def check_east_danger
		true if @current_position[0] == 4
	end

	def check_west_danger
		true if @current_position[0] == 0
	end

end

robot = Robot.new
