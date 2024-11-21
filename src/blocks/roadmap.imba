import {images} from '../assets.imba'

import {States} from '../states.imba'
let states = new States!

export tag Roadmap
	<self.block>
		<div.header>
			<span.gray> "Step four:"
			<br>
			<span> "Have "
			<span> "fun"
			<br>
			<span> "along the  "
			<br>
			<span.green> "journey"
		<div.text> "All you need are 5 real friends who know you well. Complete memetic personality test for each other by selecting the PFP mascot attributes that you think best match your friend. NO GUILT. Get your pleasure by pointing out all your friends’ pros and cons…"
		<div>
			css pos:relative mt:30px
			# <img src=map_frame [bgi:{`url("{map_back}")`}]>
			# 	css w:90vw
			<Path [bgi:{`url("{images.map.url}")`}]>
				css bgp:center center bgr:no-repeat bgo:content-box bgs: 100% 100%
			# <div>
			# 	css pos:absolute t:5% l:20% w:20%
			# 	# <Straus>
			# 	# <video playsInline loop autoplay>
			# 	# 	css o:0.99 h:25vh # w:10vw
			# 	# 	# <source src='assets/straus.mp4' type='video/quicktime;codecs=hvc1'>
			# 	# 	# <source src='assets/straus.mov' type='video/quicktime'>
			# 	# 	# <source src='assets/straus.webm' type="video/webm">
			# 	# 	# <source src="assets/straus.mov" type='video/quicktime;codecs=hvc1'>
			# 	# 	# <source src="assets/movie-hevc.mov" type='video/quicktime'>
			# 	# 	<source src="assets/straus_1.mov" type='video/quicktime'>
				
			<Tablo name='tablo1' main='Early Birds' dates="November-December 2024">
				css pos:absolute t:1% w:40% r:9%
			<Tablo name='tablo2' flip=true main="Memetic Test" dates="January-Fabruary 2025">
				css pos:absolute t:14% w:40% l:4% # t:18% w:24.41vw h:24.5vw l:22%
			<Tablo name='tablo3' main='Big Drop' dates="March-April 2025">
				css pos:absolute t:32% w:40% r:5% # t:36% w:24.5vw h:24.5vw r:25%
			<Tablo name='tablo4' main='RPG Game' dates="April-May 2025">
				css pos:absolute t:47% w:40% r:22%
			<Tablo name='tablo5' flip=true main="Quest Bot IRL" dates="May-June 2025">
				css pos:absolute t:84% w:40% l:9%
			


tag Path
	dash = 1
	gap = 0.5
	
	# @ts-ignore
	def dasharray str, left
		if left <= dash
			return (str + " {left} 100").trim!
		elif left <= dash + gap
			return (str + " {dash} 100").trim!
		str += " {dash} {gap}"
		left -= dash + gap
		return dasharray(str, left)

	def mount
		$path.style.strokeDasharray = "0% 110%"

		window.addEventListener "scroll", do
			const elem = $path.getBoundingClientRect!
			const top = 0.5 * window.innerHeight - elem.top
			
			if top < 0
				$path.style.strokeDasharray = "0% 110%"
				return
			
			const done = 100 * top / elem.height
			const dashes = dasharray("", done)
			$path.style.strokeDasharray = dashes

			states.change('tablo1', done >= 1 ? 'on' : 'off')
			states.change('tablo2', done >= 20 ? 'on' : 'off')
			states.change('tablo3', done >= 35 ? 'on' : 'off')
			states.change('tablo4', done >= 50 ? 'on' : 'off')
			states.change('tablo5', done >= 90 ? 'on' : 'off')

	<self>
		<svg viewBox="0 0 259.2 1153.2" xmlns="http://www.w3.org/2000/svg">
			<path$path stroke="#DA1B00" pathLength="100" stroke-width="5px" fill="none" d="m 36.3 12 c 0 0 -2 21.5 23.8 30.7 s 59.8 3.5 99.3 20.3 s 37.3 51 34 62 s -17 34.3 -54 46.3 s -77.4 14.7 -91.4 43 c 0 0 -10.5 20 0.5 36 s 47.8 41.5 58.5 48.7 s 43.3 26.8 56.3 63.8 s -11.5 66.8 -11.5 66.8 s -13.9 19 -41.3 32.8 c -29.2 14.6 -59.5 27.9 -69.5 65.6 s 7 64.3 24.3 87.5 s 31.5 35.5 53 73 c 22.5 39.3 13.3 47.8 7.8 58 c -3.7 6.8 -23.8 21.5 -26.3 38 s 4 29 34 40 s 51.7 12.1 77.8 33.3 c 28 22.8 24.8 46.3 21.5 58.3 c -4 14.8 -25.3 31.5 -42.3 40.8 s -28.9 13.2 -60.8 27.1 c -37.8 16.5 -56 39.3 -55.8 78.5">

tag Tablo
	flip = false
	main = ''
	dates = ''
	name = ''
	
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
			css pos:absolute l:100% d:hflex h:29% w:100% ai:center jc:center ff:"Jersey 20" fw:400 c:white ta:center
				fs:2.2rem
				fs@lt-sm:1.8rem
				fs@lt-xs:1.2rem
		<div$date> dates
			css pos:absolute t:29% h:9% w:100% ff:"Roboto" bgc:#CA3E2F fw:700 c:transparent ta:center
				fs:0.8rem
				fs@lt-sm:0.6rem
				fs@lt-xs:0.4rem
		<div [scale-x:-1]=flip>
			css pos:absolute bgi:{images.tablo.url} bgs:cover w:100% aspect-ratio: {images.tablo.width / images.tablo.height}
		
			
			# <img src=images.tablo.url [scale-x:-1]=flip loading="lazy" decoding="asynchronous" width="{images.tablo.width}" height="{images.tablo.height}">
			# 	css max-width:100% h:auto w:auto d:block


