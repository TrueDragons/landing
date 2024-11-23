import {svgs} from '../assets.imba'

tag Snowflake < img
	width
	duration = Math.round(1000 * Math.random! * 10 + 5)
	melting = 1000
	# form = (Math.random! * 100 % 3 == 0) ? "❄" : "❅"
	image = svgs.snowflakes[0]
	size = Math.round(Math.random! * 20 + 10)
	
	def setup
		const form = Math.round(Math.random! * 100) % 5
		image = svgs.snowflakes[form]
		size = Math.round(size / 4) if form > 2
		# image = svgs[Math.round(Math.random! * 100) % 5]
		# console.log size
		setTimeout(&, duration + melting) do self.remove!
		
		self.style.setProperty("--melting", "{1000}ms")
		self.style.setProperty("--duration", "{duration}ms")
		# self.style.setProperty("--size", "{Math.round(Math.random! * 6 + 10)}px")
		self.style.setProperty("--left", "{Math.round(Math.random! * width)}px")
		# self.style.setProperty("--opacity", "{(Math.random! / 2 + 0.5).toFixed(2)}")
		# self.style.setProperty("--start", "{Math.round(Math.random! * 80)}%")
		self.style.setProperty("--finish", "{100 - Math.round(Math.random! * 30)}%")
		
	css
		@keyframes 
			melt
				from o:1
				to o:0
			fall
				from t:0 
				to t:var(--finish)

	<self src=image width="{size}" height="{size}"> # w:var(--size) h:var(--size)
		css pos:absolute l:var(--left) animation: var(--duration) linear fall forwards, var(--melting) linear var(--duration) melt
			# pt:var(--start) t:calc(-1 * var(--start))
			# <img src=image width='20px' height='20px'>
			# css c:#FFFFFF pos:absolute fw:900 l:var(--left) pt:var(--start) t:calc(-1 * var(--start)) # o:var(--opacity)
			# 	animation: var(--duration) linear fall forwards, var(--melting) linear var(--duration) melt
			


export tag Snow
	generate = 70
	generator = undefined
	
	def start
		return if generator
		generator = setInterval(&, generate) do self.appendChild <Snowflake width=self.clientWidth>
	
	def stop
		return if !generator
		clearInterval(generator)
		generator = undefined

	<self @intersect.in=start @intersect.out=stop>
						
					

