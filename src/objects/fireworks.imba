import { Fireworks } from 'fireworks-js'
import {timeout} from '../common.imba'

export tag Firework
	states
	active = false

	def setup
		const options =
			friction: 0.94
			gravity: 0
			explosion: 8
			particles: 100
			lineWidth:
				explosion:
					min: 5
					max: 10
				trace:
					min: 1
					max: 2
			# decay:
			# 	min: 0.02
			# 	max: 0.05

		const fireworks = new Fireworks(self, options)
		
		if states and states.listen isa Function
			states.listen 'fireworks', do(state) 
				if state == 'on' and !active
					fireworks.start!
					active = true
					await timeout(5000)
					fireworks.waitStop(false)
				elif state == 'off' and active
					active = false
	
	<self>

