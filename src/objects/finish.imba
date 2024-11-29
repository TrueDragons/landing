import {Image} from '../objects/image.imba'

const files = 
	right_stick:
		path: './assets/avif/roadmap/finish_right_stick.avif'
		width: 16
		height: 191
		alt: "Finish line"
	left_stick:
		path: './assets/avif/roadmap/finish_left_stick.avif'
		width: 15
		height: 181
		alt: "Finish line"
	right_main:
		path: './assets/avif/roadmap/finish_right.avif'
		width: 205
		height: 74
		alt: "Finish line"
	left_main:
		path: './assets/avif/roadmap/finish_left.avif'
		width: 127
		height: 151
		alt: "Finish line"
	right_tail:
		path: './assets/avif/roadmap/finish_right_tail.avif'
		width: 71
		height: 174
		alt: "Finish line"
	left_tail:
		path: './assets/avif/roadmap/finish_left_tail.avif'
		width: 32
		height: 141
		alt: "Finish line"


export tag Finish
	states
	active = false

	css
		.waving_tails
			animation: waving 1s infinite
			@keyframes
				waving
					0%   transform: rotateX(0deg)  rotateY(20deg) scale(1,1)
					50%	 transform: rotateX(20deg) rotateY(0deg)  scale(1.05,1.05)
					100% transform: rotateX(0deg)  rotateY(20deg) scale(1,1)
		.waving_main
			animation: waving 1s infinite
			@keyframes
				waving
					0%   transform: rotateX(0deg) rotateY(10deg)
					50%	 transform: rotateX(10deg) rotateY(0deg) 
					100% transform: rotateX(0deg) rotateY(10deg)
		.apart_left
			animation: apart 1s forwards
			@keyframes
				apart
					0%   transform: rotateZ(0deg)
					100% transform: rotateZ(40deg)
		.apart_right
			animation: apart 1s forwards t:71.9% origin: 65% 0%
			@keyframes
				apart
					0%   transform: skew(0deg)   rotateX(0deg)   rotateZ(0deg) t:71.9% l:44%
					100% transform: skew(-50deg) rotateX(-20deg) rotateZ(-50deg) scaleY(1.6) scaleX(0.5) t:90% l:50%
		.apart_left
			animation: apart 1s forwards t:71.9% origin: 0% 20%
			@keyframes
				apart
					0%   transform: skew(0deg)  rotateX(0deg)  rotateZ(0deg) t:15%
					100% transform: skew(50deg) rotateX(50deg) rotateZ(40deg) scaleY(1.6) scaleX(0.6) t:14%

	def mount 
		if states and states.listen isa Function
			states.listen 'finish', do(state)
				if state == 'on' and !active
					$left.flags.add('apart_left')
					$right.flags.add('apart_right')
					active = true
				elif state == 'off' and active
					active = false
					$left.flags.remove('apart_left')
					$right.flags.remove('apart_right')

	<self>
		<div [aspect-ratio: 2]>
			css w:100% h:auto pos:relative 
			
			<div.waving_main>
				css w:100% h:100%
				
				<Image$left file=files.left_main>
					css pos:absolute w:40% h:auto l:11% t:15%
				<Image$right file=files.right_main>
					css pos:absolute w:64% h:auto l:43% t:72%
			
				<Image file=files.left_tail>
					css pos:absolute w:10% h:auto l:0% t:15%
				<Image file=files.right_tail>
					css pos:absolute w:23% h:auto l:107% t:84%

			<Image file=files.right_stick>
				css pos:absolute w:5% h:auto l:104% t:72%
			<Image file=files.left_stick>
				css pos:absolute w:5% h:auto l:9.2% t:0%