# @ts-ignore
import map_back from './images/map_back.webp'
# @ts-ignore
# import map_frame from './images/map_frame.webp'
# @ts-ignore
import straus from './assets/straus.webm'

import {Block01} from './components/block01.imba'
import {Block02} from './components/block02.imba'
import {Block03} from './components/block03.imba'
import {Block04} from './components/block04.imba'
import {Block05} from './components/block05.imba'
import {Block06} from './components/block06.imba'
import {Block07} from './components/block07.imba'
			
			
import {Straus} from './components/straus.imba'
import {Tablo} from './components/tablo.imba'

global css
	html, body
		# w: 100%
		# h: 100vh
		m: 0
		p: 0
		bgc: #CFEAF8 # #d2edf8
		overscroll-behavior: none
		scroll-snap-type: y mandatory;
	# @root
	# 	1dex: 1vw + 1vh
	.block
		d:vflex 
		h:100vh max-height:100vh min-height:100vh
		ml:auto mr:auto max-width:550px min-width:230px px:15px 
		of:hidden ai:space-between
		scroll-snap-align: start
	.header
		ff:"Sigmar One" fw:normal tt:uppercase fs:38px lh:41.8px # fs:4vh lh:5dex
		c:white ta:center
		ts: -2px 2px 0px #0f0f0f text-stroke: 1px #0f0f0f -webkit-text-stroke: 1px #0f0f0f
		pt: 30px
		mt:auto mb:auto
	.text
		ff:"Montserrat" fw:normal fs:16px ta:left
		c:#343434
		mt: 30px
		# mr: 50px ml:50px
		# ml:10vw mr:10vw
		# py:3vh


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

	<self>
		<svg viewBox="0 0 259.2 1153.2" xmlns="http://www.w3.org/2000/svg">
			<path$path stroke="#DA1B00" pathLength="100" stroke-width="5px" fill="none" d="m 36.3 12 c 0 0 -2 21.5 23.8 30.7 s 59.8 3.5 99.3 20.3 s 37.3 51 34 62 s -17 34.3 -54 46.3 s -77.4 14.7 -91.4 43 c 0 0 -10.5 20 0.5 36 s 47.8 41.5 58.5 48.7 s 43.3 26.8 56.3 63.8 s -11.5 66.8 -11.5 66.8 s -13.9 19 -41.3 32.8 c -29.2 14.6 -59.5 27.9 -69.5 65.6 s 7 64.3 24.3 87.5 s 31.5 35.5 53 73 c 22.5 39.3 13.3 47.8 7.8 58 c -3.7 6.8 -23.8 21.5 -26.3 38 s 4 29 34 40 s 51.7 12.1 77.8 33.3 c 28 22.8 24.8 46.3 21.5 58.3 c -4 14.8 -25.3 31.5 -42.3 40.8 s -28.9 13.2 -60.8 27.1 c -37.8 16.5 -56 39.3 -55.8 78.5">

tag App
	
	<self>
		# css w:100%
		<Block01>
		<Block02>
		# <Block03>
		# <Block04>
		# <Block05>
		# <Block06>
		# <Block07>
		
		# <div>
		# 	css pos:relative
		# 	# <img src=map_frame [bgi:{`url("{map_back}")`}]>
		# 	# 	css w:90vw
		# 	<Path [bgi:{`url("{map_back}")`}]>
		# 		css bgp:center center bgr:no-repeat bgo:content-box bgs: 100% 100%
		# 	<div>
		# 		css pos:absolute t:5% l:20% w:20%
		# 		# <Straus>
		# 		<video playsInline loop autoplay>
		# 			css o:0.99 h:25vh # w:10vw
		# 			# <source src='assets/straus.mp4' type='video/quicktime;codecs=hvc1'>
		# 			# <source src='assets/straus.mov' type='video/quicktime'>
		# 			# <source src='assets/straus.webm' type="video/webm">
		# 			# <source src="assets/straus.mov" type='video/quicktime;codecs=hvc1'>
		# 			# <source src="assets/movie-hevc.mov" type='video/quicktime'>
		# 			<source src="assets/straus_1.mov" type='video/quicktime'>
				
		# 	<Tablo main='  Early Birds' dates="November-December 2024">
		# 		css pos:absolute t:6% w:24.5vw h:24.5vw r:22%
		# 	<Tablo flip=true main="Memetic Test" dates="January-Fabruary 2025">
		# 		css pos:absolute t:18% w:24.41vw h:24.5vw l:22%
		# 	<Tablo main='     Big Drop' dates="March-April 2025">
		# 		css pos:absolute t:36% w:24.5vw h:24.5vw r:25%
		# 	<Tablo main='    RPG Game' dates="April-May 2025">
		# 		css pos:absolute t:50% w:24.5vw h:24.5vw r:30%
		# 	<Tablo flip=true main="Quest Bot IRL" dates="May-June 2025">
		# 		css pos:absolute t:87% w:24.41vw h:24.5vw l:16%
		# <div>
		# 	css h:100vh w:100% bgc:gray5
		

imba.mount <App>