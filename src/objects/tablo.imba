import {images} from '../assets.imba'

export tag Tablo
	flip = false
	main = ''
	dates = ''
	name = ''
	states
	
	css 
		.back
			animation: back 0.1s forwards
		.line
			animation: line 2s forwards
		.date
			animation: date 2s forwards
		@keyframes
			back
				100% bgc:#849FE4
			line
				100% l:0.3rem
			date
				0% c:transparent bgc:#CA3E2F
				90% c:transparent bgc:#CA3E2F
				92% c:white bgc:#FF7859
				96% c:transparent bgc:#CA3E2F
				100% c:white bgc:#FF7859

	def mount
		if states and states.listen isa Function
			states.listen name, do(state) 
				if state == 'on'
					$back.flags.add('back')
					# $disp.flags.add('disp')
					$line.flags.add('line')
					$date.flags.add('date')
				elif state == 'off'
					$back.flags.remove('back')
					# $disp.flags.remove('disp')
					$line.flags.remove('line')
					$date.flags.remove('date')

	<self [of:hidden aspect-ratio: {images.tablo.width / images.tablo.height}]>
		<div$back>
			css pos:absolute bgc:#47557A h:29% rdtl:20% rdtr:20% w:100%
		<div$line> main
			css pos:absolute l:100% pt:0.6rem d:hflex h:29% w:100% ai:center jc:center ff:"Arcade" fw:800 c:white ta:center
				fs:2.2rem
				fs@lt-sm:1.8rem
				fs@lt-xs:1.2rem
		<div$date>
			css pos:absolute t:26% b:64% w:100% bgc:#CA3E2F d:hflex ai:center jc:center c:transparent
			<div> dates
				css ff:"Montserrat" fw:500 ta:center
					fs:1rem
					fs@lt-sm:0.8rem
					fs@lt-xs:0.6rem
		<div [scale-x:-1]=flip>
			css pos:absolute bgi:{images.tablo.url} bgs:cover w:100% aspect-ratio: {images.tablo.width / images.tablo.height}

