import {svgs} from '../assets.imba'

tag Snowflake < img
	duration = 1000
	size = 15
	form = 0
	finish = 80
	
	def setup
		setTimeout(&, duration + 1000) do self.remove!
		self.style.setProperty("--duration", "{duration}ms")
		self.style.setProperty("--finish", "{finish}px")

	css
		@keyframes 
			melt
				from o:1
				to o:0
			fall
				0% transform: translateY(0px)
				100% transform: translateY(var(--finish))

	<self src=svgs.snowflakes[form] width="{size}" height="{size}">
		css pos:absolute will-change: transform, opacity
			animation: var(--duration) linear fall forwards, 1000ms linear var(--duration) melt
			


export tag Snow
	generate = 70
	generator = undefined
	
	def start
		return if generator
		generator = setInterval(&, generate) do
			const form = Math.round(Math.random! * 100) % 5
			const size = form > 2 ? Math.round(Math.random! * 6 + 3) : Math.round(Math.random! * self.clientWidth / 60 + self.clientWidth / 30)
			const left = Math.round(Math.random! * self.clientWidth)
			const duration = Math.round(Math.random! * 6000 + 4000)
			const finish = Math.round(self.clientHeight * ( 1 - Math.random! / 3))
			self.appendChild <Snowflake size=size form=form duration=duration finish=finish [l:{left}px]>
	
	def stop
		return if !generator
		clearInterval(generator)
		generator = undefined

	<self @intersect.in=start @intersect.out=stop>
						
					

