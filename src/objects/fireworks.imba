import { Fireworks } from 'fireworks-js'
import {timeout} from '../common.imba'

export tag Firework
	states
	active = false

	def setup
		const options =
			friction: 0.93
			gravity: 0
			explosion: 6
			particles: 20
			lineWidth:
				explosion:
					min: 5
					max: 10
				trace:
					min: 0
					max: 0.16
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

