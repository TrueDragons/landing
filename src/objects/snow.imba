
tag Showflake
	size
	left
	duration
	opacity
	
	<self [fs:{size}px l:{left}px animation-duration:{duration}s o:{opacity}]> "❄"
		css c:white pos:absolute t:-20px animation: fall linear 2s forwards fw:900
			@keyframes 
				fall
					to transform: translateY(105vh)	
export tag Snow
	count = 100
	speed = 5000
	height = 100
	snowflakes = []

	# css
	# 	@keyframes 
	# 		fall
	# 			to transform: translateY(105vh)	

	def mount
		setInterval(&, count) do
			snowflakes.push
				size: Math.random! * 20 + 10
				left: Math.random! * self.clientWidth
				duration: Math.random! * 3 + 2
				opacity: Math.random!
				start: height - Math.random! * height / 3
				flake: ((Math.random! * 100 % 3 == 0) ? "❄" : "❅")
			imba.commit!

	<self>
		for sf in snowflakes
			<div [fs:{sf.size}px l:{sf.left}px animation-duration:{sf.duration}s o:{sf.opacity} t:{sf.start}vh]> "❄"
				css c:white pos:absolute fw:900 animation: linear fall forwards
					@keyframes fall 
						to transform:translateY(100vh)
					

