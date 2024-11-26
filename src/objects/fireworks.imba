import { Fireworks } from 'fireworks-js'

export tag Firework

	def setup
		const options =
			friction: 0.88
			gravity: 0.5
			lineWidth:
				explosion:
					min: 2
					max: 5
				trace:
					min: 1
					max: 2

		const fireworks = new Fireworks(self, options)
		fireworks.start!
	
	<self>

