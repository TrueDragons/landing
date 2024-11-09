# @ts-ignore
import map_back from './images/map.webp'

import {Straus} from './components/straus.imba'
import {Tablo} from './components/tablo.imba'

global css
	html, body
		w: 100%
		h: 100vh
		m: 0
		p: 0
		# ff: 'Overpass', sans-serif
		# scroll-behavior: smooth
		# -webkit-overflow-scrolling: auto
	@root
		1dex: 1vw + 1vh


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
		<div> "version 0.0.3"
			css h:100vh w:100% bgc:gray4
			
		<div>
			css pos:relative
			<Path [bgi:{`url("{map_back}")`}]>
				css bgp:center center bgr:no-repeat bgo:content-box bgs: 100% 100%
			<div>
				css pos:absolute t:5% l:20% w:20%
				<Straus>
			<Tablo>
				css pos:absolute t:6% w:24.5vw h:24.5vw r:22% of:hidden
					
					
		<div>
			css h:100vh w:100% bgc:gray5
		

imba.mount <App>