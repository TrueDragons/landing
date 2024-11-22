
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

	def mount
		setInterval(&, count) do
			snowflakes.push
				size: Math.random! * 6
				left: Math.random! * self.clientWidth
				duration: Math.random! * 3 + 2
				opacity: Math.random!
				start: Math.random! * 30
				flake: ((Math.random! * 100 % 3 == 0) ? "❄" : "❅")
			imba.commit!

	<self>
		for sf in snowflakes
			<div [fs:{sf.size}vh l:{sf.left}px animation-duration:{sf.duration}s o:{sf.opacity} t:{sf.start}%]> sf.flake
				css c:#FFFFFF pos:absolute fw:900 animation: linear fall forwards
					@keyframes fall 
						to t:100% # transform:translateY(100%)
						
					

