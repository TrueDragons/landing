import {images} from '../assets.imba'
import {timeout, scalePath} from '../common.imba'

css
	.shoot animation: move 1000ms ease-out forwards
		@keyframes 
			move
				0%   offset-distance: 0%
				90%  offset-distance: 100% opacity:1
				100% offset-distance: 100% opacity:0
export tag Bottle
	states
	active = false
	path

	def fire
		$close.flags.add('shake')
		await timeout(1500)
		$close.flags.add('hidden').remove('shake')
		$open.flags.remove('hidden')
		$cork.flags.remove('hidden').add('shoot')

	def mount
		path = '"' + scalePath("M500,100T280,30,0,200", {x: $container.clientWidth * 0.8 / 500, y: 1}) + '"'
		if states and states.listen isa Function
			states.listen 'bottle', do(state)
				if state == 'on' and !active
					fire!
					active = true
				elif state == 'off' and active
					active = false
					$close.flags.remove('hidden')
					$open.flags.add('hidden')
					$cork.flags.add('hidden').remove('shoot')

	css
		.hidden o:0
		.shake
			animation: shake 0.5s linear 3
			@keyframes
				shake
					0% transform: rotateX(0) scaleX(1) # scaleY(0)
					50% transform: rotateX(45deg) scaleX(0.8) # scaleY(0.5)

	<self>
		<div$container>
			css inset: 0 w:80% pos:relative h:{images.bottle_close.height}px ml:auto mr:auto
			<img$close src=images.bottle_close.url loading="lazy" decoding="asynchronous" width="{images.bottle_close.width}" height="{images.bottle_close.height}">
				css pos:absolute w:15% h:auto t:0 r:0
			<img$open.hidden src=images.bottle_open.url loading="lazy" decoding="asynchronous" width="{images.bottle_open.width}" height="{images.bottle_open.height}">
				css pos:absolute w:15% h:auto t:0 r:0
			<img$cork.hidden src=images.cork.url loading="lazy" decoding="asynchronous" width="{images.cork.width}" height="{images.cork.height}">
				css pos:absolute h:auto w:3% l:7% t:-45%
					offset-path:path({path})
					offset-distance:0%