import {images} from '../assets.imba'
import {timeout} from '../common.imba'

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
			css w:10% h:auto aspect-ratio:{images.bird_body.width / images.bird_body.height}
			<img$rhand .rhand src=images.bird_right_hand.url loading="lazy" decoding="asynchronous" width="{images.bird_right_hand.width}" height="{images.bird_right_hand.height}">
				css pos:absolute w:100% h:auto 
			<img$lhand .lhand src=images.bird_left_hand.url loading="lazy" decoding="asynchronous" width="{images.bird_left_hand.width}" height="{images.bird_left_hand.height}">
				css pos:absolute w:100% h:auto 
			<img$lleg .lleg src=images.bird_left_leg.url loading="lazy" decoding="asynchronous" width="{images.bird_left_leg.width}" height="{images.bird_left_leg.height}">
				css pos:absolute w:100% h:auto 
			<img$rleg .rleg src=images.bird_right_leg.url loading="lazy" decoding="asynchronous" width="{images.bird_right_leg.width}" height="{images.bird_right_leg.height}">
				css pos:absolute w:100% h:auto 
			<img$body src=images.bird_body.url loading="lazy" decoding="asynchronous" width="{images.bird_body.width}" height="{images.bird_body.height}">
				css pos:absolute w:100% h:auto 
			