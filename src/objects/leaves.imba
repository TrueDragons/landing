import {images} from '../assets.imba'
import {timeout} from '../common.imba'

css
	.path1 offset-path: path("M 320,0 C 315.7,79.15,240.7,194.15,170,230,137.43,246.51,67.43,286.51,120,210,268.5,-6.15,320,480,160,500")
	.path2 offset-path: path("M 120,0 C 175.31,38.07,225.31,143.07,220,210,217.22,245.01,157.22,255.01,100,230,10.14,190.73,80.14,125.73,240,100,579.78,45.31,544.78,245.31,170,500")
	.path3 offset-path: path("M 400,0 T 270,160,160,170,310,180,280,440,230,300,380,490")
	.path4 offset-path: path("M 150,0 T 240,290,450,340,180,300,330,500")
	.path5 offset-path: path("M 260,0 T 110,270,280,310,230,170,360,490")
	.path6 offset-path: path("M 300,0 T 80,150,260,200,360,260,40,460,200,500")
	.base
		offset-rotate: auto reverse
		@keyframes 
			move
				0%   offset-distance: 0%
				90%  offset-distance: 100% opacity:1
				100% offset-distance: 100% opacity:0
	

tag Leave < img
	image
	path
	duration = Math.random! * 10000 + 5000

	def setup
		self.style.setProperty('--duration', "{duration}ms")

		image = images["leave{Math.ceil(Math.random! * 6)}"].url
		const num = Math.ceil(Math.random! * 3)
		path = "path{num}"

	def mount
		await timeout(duration)
		self.remove!

	<self.base.{path} src=image loading="lazy" decoding="asynchronous" width="100" height="100">
		css pos:absolute w:100% h:auto t:0 l:0
			animation: move var(--duration) ease-out


export tag Leaves
	generator = undefined
	
	def start
		return if generator
		generator = setInterval(&, 1000) do
			self.appendChild <Leave [w:7% h:auto]>
	
	def stop
		return if !generator
		clearInterval(generator)
		generator = undefined

	<self [aspect-ratio: 0.5] @intersect.in=start @intersect.out=stop>
