require_relative '../robot.rb'

describe Robot do	

	describe 'Start Game' do
		
		context 'Robot on the table' do
			let!(:file) { File.readlines('test1.txt') }
			it 'displays current position' do
				robot = Robot.new(file)
				robot.start_game
				expect(robot.start_game).to eq('0,1,NORTH')
			end
		end

		context 'Robot not on table' do
			let!(:file) { File.readlines('test7.txt') }
			it 'shows reminder' do
				robot = Robot.new(file)
				robot.start_game
				expect(robot.errors.full_messages).to include('Please place robot on the board first!')
			end
		end

		context 'Stop robot from falling' do
			let!(:file) { File.readlines('test8.txt') }
			it 'remains at same place' do
				robot = Robot.new(file)
				robot.start_game
				expect(robot.start_game).to eq('0,0,WEST')
			end
		end

	end
end