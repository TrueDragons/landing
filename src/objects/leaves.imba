import {timeout, scalePath} from '../common.imba'

const paths = [
	"M40,0T60,220,450,500"
	"M140,0T50,230,460,500"
	"M270,0T90,240,470,500"
	"M410,0T210,260,310,490"
	"M490,0T230,250,480,500"
	"M360,0T120,180,310,210,30,500"
	"M480,0T450,240,20,500"
	"M310,0T330,250,150,500"
	"M170,0T330,250,280,500"
	"M40,0T330,250,30,500"
	"M60,0T300,220,230,320,280,190,40,500"
	"M430,0T150,120,180,360,480,250,240,250,460,500"
]

let scaled = []

tag Leave < img
	css
		&.base
			offset-rotate: auto reverse
			pos:absolute w:100% h:auto t:0 l:10% o:0
			animation: move var(--duration) ease-out
			offset-path:path(var(--path))
			offset-distance: 0%
			@keyframes 
				move
					0%   offset-distance: 0%   opacity:1
					90%  offset-distance: 100% opacity:1
					100% offset-distance: 100% opacity:0

	def setup
		const path = scaled[Math.floor(Math.random! * paths.length)]
		const duration = Math.random! * 10000 + 5000
		self.style.setProperty('--path', "{path}")
		self.style.setProperty('--duration', "{duration}ms")
		await timeout(duration)
		self.remove!
	

tag Leave1 < Leave
	<self.base src='assets/avif/roadmap/leave1.avif' loading="lazy" decoding="asynchronous" width="100" height="100" alt="Leave">
tag Leave2 < Leave
	<self.base src='assets/avif/roadmap/leave2.avif' loading="lazy" decoding="asynchronous" width="100" height="100" alt="Leave">
tag Leave3 < Leave
	<self.base src='assets/avif/roadmap/leave3.avif' loading="lazy" decoding="asynchronous" width="100" height="100" alt="Leave">
tag Leave4 < Leave
	<self.base src='assets/avif/roadmap/leave4.avif' loading="lazy" decoding="asynchronous" width="100" height="100" alt="Leave">
tag Leave5 < Leave
	<self.base src='assets/avif/roadmap/leave5.avif' loading="lazy" decoding="asynchronous" width="100" height="100" alt="Leave">
tag Leave6 < Leave
	<self.base src='assets/avif/roadmap/leave6.avif' loading="lazy" decoding="asynchronous" width="100" height="100" alt="Leave">


export tag Leaves
	generator = undefined
	
	def start
		scaled = []
		for path in paths
			scaled.push '"' + scalePath(path, {x: self.clientWidth * 0.8 / 500, y: self.clientHeight / 500 }) + '"'

		return if generator
		generator = setInterval(&, 800) do
			const form = Math.ceil(Math.random! * 6)
			if form == 1
				self.appendChild <Leave1 [w:7% h:auto]>
			elif form == 2
				self.appendChild <Leave2 [w:7% h:auto]>
			elif form == 3
				self.appendChild <Leave3 [w:7% h:auto]>
			elif form == 4
				self.appendChild <Leave4 [w:7% h:auto]>
			elif form == 5
				self.appendChild <Leave5 [w:7% h:auto]>
			elif form == 6
				self.appendChild <Leave6 [w:7% h:auto]>
	
	def stop
		return if !generator
		clearInterval(generator)
		generator = undefined

	<self [aspect-ratio: 2] @intersect.in=start @intersect.out=stop>
