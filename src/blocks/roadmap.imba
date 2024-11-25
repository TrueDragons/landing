import {images} from '../assets.imba'
import {videos} from '../assets.imba'

import {States} from '../states.imba'
let states = new States!

import {Straus} from '../objects/straus.imba'
import {Snowman} from '../objects/snowman.imba'
import {Tablo} from '../objects/tablo.imba'

import {Snow} from '../objects/snow.imba'
import {Fireworks} from '../objects/fireworks.imba'
import {Garland} from '../objects/garland.imba'
import {Start} from '../objects/start.imba'
import {Animation} from '../objects/animation.imba'

export tag Roadmap
	<self.block>
		<div.header>
			<span> "DRAGON TRUE PATH"
			# <span.gray> "Step four:"
			# <br>
			# <span> "Have "
			# <span> "fun"
			# <br>
			# <span> "along the  "
			# <br>
			# <span.green> "journey"
		<div.text> "All you need are 5 real friends who know you well. Complete memetic personality test for each other by selecting the PFP mascot attributes that you think best match your friend. NO GUILT. Get your pleasure by pointing out all your friends’ pros and cons…"
		<div>
			css pos:relative mt:30px
			# <img src=map_frame [bgi:{`url("{map_back}")`}]>
			# 	css w:90vw
			<img src=images.map.url loading="lazy" decoding="asynchronous" width="{images.map.width}" height="{images.map.height}">
				css w:100% h:auto zi:-1 # pos:absolute l:0 t:0
			<Path> # [bgi:{`url("{images.map.url}")`}] 
				css pos:absolute  l:0 t:0 w:100% h:100%
			# 	css bgp:center center bgr:no-repeat bgo:content-box bgs: 100% 100%
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
			
			<Snow>
				css pos:absolute t:32% w:90% l:4% h:24% zi:1
			<Straus>
				css pos:absolute t:4% w:20% l:18%
			# <Animation file=videos.snowman r=20 g=255 b=13>
			<Snowman>
				css pos:absolute zi:0 w:10% t:38% l:5%
			<Fireworks states=states>
				css pos:absolute t:32% w:100% l:0% aspect-ratio: 2.6
			<Tablo states=states name='tablo1' main='Early Birds' dates="November-December 2024">
				css pos:absolute t:1% w:45% r:9%
			<Tablo states=states name='tablo2' flip=true main="MEME Test" dates="January-Fabruary 2025">
				css pos:absolute t:14% w:45% l:4% # t:18% w:24.41vw h:24.5vw l:22%
			<Tablo states=states name='tablo3' main='Big Drop' dates="March-April 2025">
				css pos:absolute t:32% w:45% r:5% # t:36% w:24.5vw h:24.5vw r:25%
			<img src=images.gifts.url loading="lazy" decoding="asynchronous" width="{images.gifts.width}" height="{images.gifts.height}">
				css pos:absolute t:38% w:45% r:3% h:auto 
			<img src=images.festoon.url loading="lazy" decoding="asynchronous" width="{images.festoon.width}" height="{images.festoon.height}">
				css pos:absolute t:31.6% w:9% r:22.8% h:auto 
			<Garland states=states>
				css pos:absolute t:31.4% w:43% r:6% h:auto 
			<Start states=states>
				css pos:absolute t:55% w:33% r:48% h:auto 
			<Tablo states=states name='tablo4' main='RPG Game' dates="April-May 2025">
				css pos:absolute t:47% w:45% r:22% zi:2
			<Tablo states=states name='tablo5' flip=true main="Quests IRL" dates="May-June 2025">
				css pos:absolute t:82.5% w:45% l:7%
			


tag Path
	dash = 1.5
	gap = 1.5
	
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
			states.change('fireworks', done >= 30 and done <= 60 ? 'on' : 'off')
			states.change('garland', done >= 35 ? 'on' : 'off')
			states.change('start', done >= 60 ? 'on' : 'off')
			
			

	<self>
		<svg viewBox="0 0 259.2 1153.2" xmlns="http://www.w3.org/2000/svg">
			css h:100%
			<path$path stroke="#DA1B00" pathLength="100" stroke-width="8px" fill="none" d="m 36.3 12 c 0 0 -2 21.5 23.8 30.7 s 59.8 3.5 99.3 20.3 s 37.3 51 34 62 s -17 34.3 -54 46.3 s -77.4 14.7 -91.4 43 c 0 0 -10.5 20 0.5 36 s 47.8 41.5 58.5 48.7 s 43.3 26.8 56.3 63.8 s -11.5 66.8 -11.5 66.8 s -13.9 19 -41.3 32.8 c -29.2 14.6 -59.5 27.9 -69.5 65.6 s 7 64.3 24.3 87.5 s 31.5 35.5 53 73 c 22.5 39.3 13.3 47.8 7.8 58 c -3.7 6.8 -23.8 21.5 -26.3 38 s 4 29 34 40 s 51.7 12.1 77.8 33.3 c 28 22.8 24.8 46.3 21.5 58.3 c -4 14.8 -25.3 31.5 -42.3 40.8 s -28.9 13.2 -60.8 27.1 c -37.8 16.5 -56 39.3 -55.8 78.5">
