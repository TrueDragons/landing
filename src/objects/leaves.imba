import {timeout, scalePath} from '../common.imba'

const paths = [
	"M320,0C315.7,79.15,240.7,194.15,170,230,137.43,246.51,67.43,286.51,120,210,268.5,-6.15,320,480,160,500"
	"M120,0C175.31,38.07,225.31,143.07,220,210,217.22,245.01,157.22,255.01,100,230,10.14,190.73,80.14,125.73,240,100,579.78,45.31,544.78,245.31,170,500"
	"M400,0T270,160,160,170,310,180,280,440,230,300,380,490"
	"M150,0T240,290,450,340,180,300,330,500"
	"M260,0T110,270,280,310,230,170,360,490"
	"M300,0T80,150,260,200,360,260,40,460,200,500"
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
		const path = scaled[Math.floor(Math.random! * 6)]
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
