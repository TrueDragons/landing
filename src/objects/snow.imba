
tag Snowflake
	width
	duration = Math.round(1000 * Math.random! * 3 + 2)
	melting = 1000
	form = (Math.random! * 100 % 3 == 0) ? "❄" : "❅"
	
	def setup
		setTimeout(&, duration + melting) do self.remove!
		
		self.style.setProperty("--melting", "{1000}ms")
		self.style.setProperty("--duration", "{duration}ms")
		self.style.setProperty("--size", "{Math.round(Math.random! * 6)}vh")
		self.style.setProperty("--left", "{Math.round(Math.random! * width)}px")
		self.style.setProperty("--opacity", "{(Math.random! / 2 + 0.5).toFixed(2)}")
		self.style.setProperty("--start", "{Math.round(Math.random! * 80)}%")
		
	css
		@keyframes 
			melt
				to o:0
			fall 
				to t:100%

	<self> form
		css c:#FFFFFF pos:absolute fw:900 fs:var(--size) l:var(--left) o:var(--opacity) pt:var(--start) t:calc(-1 * var(--start))
			animation: var(--duration) linear fall forwards, var(--melting) linear var(--duration) melt
			


export tag Snow
	generate = 100
	generator = undefined
	
	def start
		return if generator
		generator = setInterval(&, generate) do self.appendChild <Snowflake width=self.clientWidth>
	
	def stop
		return if !generator
		clearInterval(generator)
		generator = undefined

	<self @intersect.in=start @intersect.out=stop>
						
					

