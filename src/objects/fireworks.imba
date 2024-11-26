import { Fireworks } from 'fireworks-js'

export tag Firework

	def setup
		const fireworks = new Fireworks(self, {})
		fireworks.start!
	
	<self>

