module ToyHelper

	def placed_on_board?
		if @current_direction.nil?
			errors.add(:base,'Please place robot on the board first!')
			false
		else 
			true
		end
	end

	def check_danger_and_move(direction)
		if (direction == 'NORTH' || direction == 'EAST') && @y_coordinate == 4 
			true
		elsif (direction == 'SOUTH' || direction == 'WEST') && @y_coordinate == 0
			true
		else
			move_robot
		end
	end

	def move_robot
		if @current_direction == 'NORTH'
			@y_coordinate += 1
		elsif @current_direction == 'EAST'
			@x_coordinate += 1
		elsif @current_direction == 'SOUTH'
			@y_coordinate -= 1
		elsif @current_direction == 'WEST'
			@x_coordinate -= 1
		else
			@x_coordinate
		end
	end
end