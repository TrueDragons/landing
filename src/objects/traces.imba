import {timeout, scalePath} from '../common.imba'

const files = 
	trace:
		path: './assets/avif/roadmap/trace.avif'
		width: 54
		height: 54
		alt: "Trace"

const SPEED = 400

tag Trace < img
	duration = SPEED *  5
	count = 0
	left = false

	def setup
		self.style.setProperty('--duration', "{duration}ms")
		self.style.setProperty('--distance', "{count * 5}%")

	def mount
		await timeout(duration)
		self.remove!

	<self.path [scale-x:-1 x:150%]=left src=files.trace.path loading="lazy" decoding="asynchronous" width=files.trace.width height=files.trace.height alt=files.trace.alt>
		css pos:absolute w:100% h:auto t:0 l:0 o:0
			offset-distance: var(--distance) offset-rotate: 90deg auto
			animation: show var(--duration) linear
			offset-path: path(var(--path))
			@keyframes 
				show
					0%   opacity: 0%
					30%  opacity: 100%
					70%  opacity: 100%
					100% opacity: 0%


export tag Traces
	generator = undefined
	count = -1
	path = "M50,40T190,120,310,440"

	def mount
		path = '"' + scalePath(path, {x: self.clientWidth * 0.8 / 500, y: self.clientHeight / 500 }) + '"'
		self.style.setProperty('--path', "{path}")
	
	def start
		return if generator
		generator = setInterval(&, SPEED) do
			count++
			const left = count % 2 
			self.appendChild <Trace count=count left=left [w:7% h:auto]>
			count = -1 if count >= 20
	
	def stop
		return if !generator
		clearInterval(generator)
		generator = undefined

	<self [aspect-ratio: 0.5] @intersect.in=start @intersect.out=stop>

