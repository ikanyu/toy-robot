require 'byebug'
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
      if action.upcase == 'PLACE'
        @x_coordinate, @y_coordinate, @current_direction = data[1].split(',')
        @x_coordinate = @x_coordinate.to_i
        @y_coordinate = @y_coordinate.to_i
        @current_direction = @current_direction.upcase
        if @x_coordinate < 0 || @y_coordinate < 0
          @x_coordinate = 0
          @y_coordinate = 0
          @current_direction = nil
          puts 'X and Y coordinate must be bigger than 0!'
        end
      elsif action.upcase == 'LEFT'
        left
      elsif action.upcase == 'RIGHT'
        right
      elsif action.upcase == 'REPORT'
        report
      elsif action.upcase == 'MOVE'
        move
      else
        return
      end
    end
    @report
  end

  def left
    return unless placed_on_board?
    position = @direction.find_index(@current_direction)
    @current_direction = @direction[position - 1]
  end

  def right
    return unless placed_on_board?
    position = @direction.find_index(@current_direction)
    position == 3 ? @current_direction = @direction[0] : @current_direction = @direction[position + 1]
  end

  def move
    return unless placed_on_board?
    check_danger_and_move(@current_direction)
  end

  def report
    if placed_on_board?
      @report = "#{@x_coordinate},#{@y_coordinate},#{@current_direction}" 
      puts @report
    else
      puts "Toy not placed on board"
    end
  end

end