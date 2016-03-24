# Toy Robot Simulator

###Description
- The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.

###Commands
- **PLACE** X,Y,F: Put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST
- **MOVE**: Moves the toy robot one unit forward in the direction it is currently facing
- **LEFT and RIGHT**: Rotates the robot 90 degrees in the specified direction without changing the position of the robot.
- **REPORT**: Announces the X,Y and F of the robot. This can be in any form, but standard output is sufficient.

###Constraints
- The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot.
- Any move that would cause the robot to fall must be ignored.

###Setup
```
git clone https://github.com/ikanyu/toy-robot.git
cd toy-robot
bundle install
```

###Run Simulator
```
irb
require_relative 'robot.rb'
instruction = File.readlines('test1.txt')
robot = Robot.new(instruction)
robot.start_game
exit
```
Replace txt file name with numbers from 1 to 9

###Test run
```
rspec spec
```
