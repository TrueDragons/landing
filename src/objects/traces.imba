import {images} from '../assets.imba'
import {timeout} from '../common.imba'

css
	.path offset-path: path("M 50,40 T 190,120,310,440")

const SPEED = 200

tag Trace < img
	image
	path
	duration = SPEED *  5
	count = 0
	left = false

	def setup
		image = images.trace.url
		self.style.setProperty('--duration', "{duration}ms")
		self.style.setProperty('--distance', "{count * 5}%")

	def mount
		await timeout(duration)
		self.remove!

	<self.path [scale-x:-1 x:150%]=left src=image loading="lazy" decoding="asynchronous" width="56" height="56">
		css pos:absolute w:100% h:auto t:0 l:0 o:0
			offset-distance: var(--distance) offset-rotate: 90deg auto
			animation: show var(--duration) linear
			@keyframes 
				show
					0%   opacity: 0%
					30%  opacity: 100%
					70%  opacity: 100%
					100% opacity: 0%


export tag Traces
	generator = undefined
	count = -1
	
	def start
		return if generator
		generator = setInterval(&, SPEED) do
			# self.appendChild <TraceLeft [w:7% h:auto]>
			count++
			const left = count % 2 
			self.appendChild <Trace count=count left=left [w:7% h:auto]>
			count = -1 if count >= 20
	
	def stop
		return if !generator
		clearInterval(generator)
		generator = undefined

	<self [aspect-ratio: 0.5] @intersect.in=start @intersect.out=stop>

