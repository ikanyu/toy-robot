require 'active_model'
require_relative 'toy_helper.rb'

class Robot

	include ActiveModel::Model
	include ToyHelper

	attr_accessor :x_coordinate, :y_coordinate, :current_direction, :commands, :report

	def initialize(filename)
		@direction = ['NORTH', 'EAST', 'SOUTH', 'WEST']
		@commands = filename
		@x_coordinate = 0
		@y_coordinate = 0
	end

	def start_game
		@commands.each do |command|
			data = command.split(' ')
			action = data[0]
			case action
			when 'PLACE'				
				@x_coordinate, @y_coordinate, @current_direction = data[1].split(',')
				@x_coordinate = @x_coordinate.to_i
				@y_coordinate = @y_coordinate.to_i
			when 'LEFT'
				left
			when 'RIGHT'
				right
			when 'REPORT'
				report
			when 'MOVE'
				move
			end
		end
		@report
	end

	def left
		return errors.full_messages unless placed_on_board?
		position = @direction.find_index(@current_direction)
		@current_direction = @direction[position - 1]
	end

	def right
		return errors.full_messages unless placed_on_board?
		position = @direction.find_index(@current_direction)
		position == 3 ? @current_direction = @direction[0] : @current_direction = @direction[position + 1]
	end

	def move
		return errors.full_messages unless placed_on_board?
		check_danger_and_move(@current_direction)
	end

	def report
		@report = "#{@x_coordinate},#{@y_coordinate},#{@current_direction}" unless @current_direction.nil?
	end

end