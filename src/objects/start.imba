import {images} from '../assets.imba'

export tag Start
	states
	active = false

	def mount
	
		if states and states.listen isa Function
			states.listen 'start', do(state) 
				if state == 'on' and !active
					active = true
					$fl.flags.add('waveleft')
					$fr.flags.add('waveright')
				elif state == 'off' and active
					active = false
					$fl.flags.remove('waveleft')
					$fr.flags.remove('waveright')
	css
		.distortion animation: 1s distortion infinite
			@keyframes 
				distortion
					0%   transform: rotateZ(-15deg) rotateX(0deg) rotateY(10deg) # scale(1,1)
					50%	 transform: rotateZ(-15deg) rotateX(10deg) rotateY(0deg) # scale(1.1,1.1)
					100% transform: rotateZ(-15deg) rotateX(0deg)  rotateY(10deg) # scale(1,1)
		.waveleft 
			animation: waveleft 1s backwards
			origin: 90% 70%
			@keyframes 
				waveleft
					0% transform: rotateZ(0deg) 
					50% transform: rotateZ(90deg)
					100% transform: rotateZ(0deg)
		.waveright 
			animation: waveright 1s backwards
			origin: 0% 80%
			@keyframes 
				waveright
					0% transform: rotateZ(0deg) 
					50% transform: rotateZ(-90deg)
					100% transform: rotateZ(0deg)
		
	<self>
		<div [aspect-ratio: {images.start.width / images.start.height}]>
			css w:100% h:auto pos:relative zi:2
			<img src=images.start.url loading="lazy" decoding="asynchronous" width="{images.start.width}" height="{images.start.height}">
				css pos:absolute w:100% h:auto l:0 t:0
			<div.distortion>
				css pos: absolute w:100% h:auto l:44% t:60% aspect-ratio: 1.8 scale:1.2 # rotate:-15deg
				<img$fl src=images.flag_l.url loading="lazy" decoding="asynchronous" width="{images.flag_l.width}" height="{images.flag_l.height}">
					css pos:absolute w:50% h:auto l:0 t:7%
				<img$fr src=images.flag_r.url loading="lazy" decoding="asynchronous" width="{images.flag_r.width}" height="{images.flag_r.height}">
					css pos:absolute w:50% h:auto l:30% t:0 filter: url('#noise')
		<img src=images.map_cover.url loading="lazy" decoding="asynchronous" width="{images.map_cover.width}" height="{images.map_cover.height}">
			css pos:absolute w:100% h:auto l:0 t:0
