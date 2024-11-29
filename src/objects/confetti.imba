import {Image} from '../objects/image.imba'
import {timeout} from '../common.imba'

const files = 
	confetti1:
		path: './assets/avif/roadmap/confetti1.avif'
		width: 144
		height: 144
		alt: 'Confetti'
	confetti2:
		path: './assets/avif/roadmap/confetti2.avif'
		width: 144
		height: 144
		alt: 'Confetti'

export tag Confetti
	states
	fire
	active = false

	def mount
		const confetti = require('canvas-confetti')

		const options = 
			resize: true
			useWorker: true
		fire = confetti.create($canvas, options)

		if states and states.listen isa Function
			states.listen 'confetti', do(state)
				if state == 'on' and !active
					fire1!
					await timeout(500)
					fire2!
					active = true
				elif state == 'off' and active
					active = false
		

	def fire1
		$confetti1.flags.add('shake1')
		await timeout(1500)
		$confetti1.flags.remove('shake1')
		const settings = 
			angle: 45
			particleCount: 200
			spread: 50
			startVelocity: 35
			ticks: 80
			# decay: 0.8
			# scalar: 0.8
			origin: { y: 0.7, x: 0 }
		await fire(settings)

	def fire2
		$confetti2.flags.add('shake2')
		await timeout(1500)
		$confetti2.flags.remove('shake2')
		const settings = 
			angle: 60
			particleCount: 200
			spread: 40
			startVelocity: 15
			ticks: 50
			# decay: 0.8
			# scalar: 0.8
			origin: { y: 0.7, x: 0.2 }
		await fire(settings)


	css
		.shake1
			animation: shake 0.5s linear 3
			@keyframes
				shake
					0% transform: rotateZ(45deg) scaleY(1) # scaleY(0)
					50% transform: rotateZ(45deg) scaleY(0.7) # scaleY(0.5)
		.shake2
			animation: shake 0.5s linear 3
			@keyframes
				shake
					0% transform: rotateZ(60deg) scaleY(1) # scaleY(0)
					50% transform: rotateZ(60deg) scaleY(0.7) # scaleY(0.5)

	<self>
		<canvas$canvas>
			css w:200%
		<Image$confetti1 file=files.confetti1>
			css pos:absolute w:20% h:auto transform: rotateZ(45deg) t:70% l:0%
		<Image$confetti2 file=files.confetti2>
			css pos:absolute w:20% h:auto transform: rotateZ(60deg) t:70% l:20%

