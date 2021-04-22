require 'ruby2d'

set background: 'navy'
set title: 'Quick Select'

message = Text.new('Function 4', x: 295, y: 220)
game_started = false
square = nil
start_time = nil
duration = nil

on :mouse_down do |event|
  # x and y coordinates of the mouse button event
  puts event.x, event.y

  if game_started
  	if square.contains?(event.x, event.y)
  	  duration = ((Time.now - start_time) * 1000).round
  	  message = Text.new(" Well Done! You took: #{duration} milliseconds To Launch Function 4. Click to begin", x: 20, y: 20)
  	  square.remove
  	  game_started = false
  	end
  else
    message.remove

    square = Square.new(
      x: rand(get(:width) - 30), y: rand(get(:height) - 30),
      size: 30,
      color: 'purple'
    )

    start_time = Time.now
    game_started = true
  end
end

show