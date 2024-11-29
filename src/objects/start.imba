import {Image} from '../objects/image.imba'

const files =
	start:
		path: './assets/avif/roadmap/start.avif'
		width: 345
		height: 189
		alt: "Start sign"
	flagl:
		path: './assets/avif/roadmap/flag_l.avif'
		width: 126
		height: 134
		alt: 'Left flag'
	flagr:
		path: './assets/avif/roadmap/flag_r.avif'
		width: 124
		height: 134
		alt: 'Right flag'
	patch:
		path: './assets/avif/roadmap/map_patch.avif'
		width: 191
		height: 169
		alt: 'Map patch'


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
		.waveleft animation: waveleft 1s backwards
			@keyframes 
				waveleft
					0% transform: rotateZ(0deg) 
					50% transform: rotateZ(90deg)
					100% transform: rotateZ(0deg)
		.waveright animation: waveright 1s backwards
			@keyframes 
				waveright
					0% transform: rotateZ(0deg) 
					50% transform: rotateZ(-90deg)
					100% transform: rotateZ(0deg)
		
	<self>
		<div [aspect-ratio: {files.start.width / files.start.height}]>
			css w:100% h:auto pos:relative zi:2
			<Image file=files.start>
				css pos:absolute w:100% h:auto l:0 t:0
			<div.distortion>
				css pos: absolute w:100% h:auto l:44% t:60% aspect-ratio: 1.8 scale:1.2 # rotate:-15deg
				<Image$fl file=files.flagl>
					css pos:absolute w:50% h:auto l:0 t:7% origin: 90% 66% # transform:rotateZ(90deg)
				<Image$fr file=files.flagr>
					css pos:absolute w:50% h:auto l:30% t:0 origin: 0% 82% # transform:rotateZ(-90deg)
		<Image file=files.patch>
			css pos:absolute w:100% h:auto l:0 t:0
