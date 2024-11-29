import {timeout} from '../common.imba'
import {Image} from '../objects/image.imba'

const files = 
	body:
		path: './assets/avif/roadmap/bird_body.avif'
		width: 167
		height: 80
		alt: "Body"
	rhand:
		path: './assets/avif/roadmap/bird_right_hand.avif'
		width: 167
		height: 80
		alt: "Right hand"
	rleg:
		path: './assets/avif/roadmap/bird_right_leg.avif'
		width: 167
		height: 80
		alt: "Right leg"
	lhand:
		path: './assets/avif/roadmap/bird_left_hand.avif'
		width: 167
		height: 80
		alt: "Left hand"
	lleg:
		path: './assets/avif/roadmap/bird_left_leg.avif'
		width: 167
		height: 80
		alt: "Left leg"

export tag Bird

	def mount
		walk!

	def walk right = true
		if right 
			$bird.flags.remove('moveleft')
			$bird.flags.add('moveright')
			await timeout(4000)
			walk(false)
		else
			$bird.flags.remove('moveright')
			$bird.flags.add('moveleft')
			await timeout(4000)
			walk(true)


	css 
		.rleg
			animation: rleg 1s infinite origin: 60% -20%
			@keyframes
				rleg
					0% transform: rotateZ(10deg)
					50% transform: rotateZ(40deg)
					100% transform: rotateZ(10deg)
		.lleg
			animation: lleg 1s infinite origin: 50% 30%
			@keyframes
				lleg
					0% transform: rotateZ(30deg)
					50% transform: rotateZ(-40deg)
					100% transform: rotateZ(30deg)
		.rhand
			animation: rhand 0.5s infinite origin: 50% 30%
			@keyframes
				rhand
					0% transform: rotateZ(0deg)
					50% transform: rotateZ(-5deg)
					100% transform: rotateZ(0deg)
		.lhand
			animation: lhand 0.5s infinite origin: 60% 80%
			@keyframes
				lhand
					0% transform: rotateZ(0deg)
					50% transform: rotateZ(5deg)
					100% transform: rotateZ(0deg)
		.moveright
			animation: moveright 4s linear forwards origin: 100% 0%
			@keyframes
				moveright
					0% transform: translateX(0cqw)
					100% transform: translateX(calc(90cqw - 100%))
		.moveleft
			animation: moveleft 4s linear forwards origin: 100% 0%
			@keyframes
				moveleft
					0% transform: translateX(calc(90cqw - 100%)) scaleX(-1)
					100% transform: translateX(0cqw) scaleX(-1)

	<self [container-type: inline-size]>
		<div$bird>
			css w:10% h:auto aspect-ratio:{files.body.width / files.body.height}
			<Image$rhand .rhand file=files.rhand>
				css pos:absolute w:100% h:auto 
			<Image$lhand .lhand file=files.lhand>
				css pos:absolute w:100% h:auto 
			<Image$lleg .lleg file=files.lleg>
				css pos:absolute w:100% h:auto 
			<Image$rleg .rleg file=files.rleg>
				css pos:absolute w:100% h:auto 
			<Image$body file=files.body>
				css pos:absolute w:100% h:auto 
			