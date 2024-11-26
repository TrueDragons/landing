class Fire
	ctx
	width
	height
	x = Math.random!
	t = 0
	tmod = 20 + Math.random! * 20 | 0
	tmax = 500 + Math.random! * 1000
	mx = -0.02 * Math.random! * 0.04
	y = 1
	ym = 0.05 + Math.random! * 0.5
	render = shot
	color = do(fac = 1) "hsl({shade}, {fac * 100}%, {fac * 60}%)"
	base = Math.random! * 360 | 0
	shade = (275 * (base / 200 | 0)) + base % 200
	flashes = []

	# --------------------------------
	def constructor context, w, h
		ctx = context
		width = w
		height = h
		for i in [0 .. 32]
			flashes.push {r: 2 * i / Math.PI, s: 0.5 + Math.random! * 0.5, d: 0, y: 0}

	# --------------------------------
	def shot
		x += mx
		y -= 0.01

		const r = Math.atan2(-0.01, mx)

		ctx.strokeStyle = color(0.7)
		ctx.beginPath!

		ctx.moveTo(x * width + Math.cos(r) * 4,	y * height + Math.sin(r) * 4)
		ctx.lineTo(x * width + Math.cos(r + Math.PI) * 4, y * height + Math.sin(r + Math.PI) * 4)

		ctx.lineWidth = 3
		ctx.stroke!

		render = explode if y < ym
		return true

	# --------------------------------
	def explode

		ctx.fillStyle = color!
		let proceed = false
		for flash in flashes when !flash.finished
			flash.d += flash.s
			flash.s *= 0.99
			flash.y += 0.5

			const alpha = flash.s * 2.5
			ctx.globalAlpha = alpha

			if alpha > 0.05
				proceed = true
				ctx.fillRect(Math.cos(flash.r) * flash.d + x * width, Math.sin(flash.r) * flash.d + flash.y + y * height, 3,3)
			else 
				flash.finished = true
		
		ctx.globalAlpha = 1
		return proceed


# --------------------------------------------
# --------------------------------------------
# --------------------------------------------
export tag Fireworks < canvas
	ctx = getContext('2d')
	fireworks = new Map!
	count = 0
	active = false
	states

	def fire
		return if !active
		count++
		fireworks.set(count, new Fire(ctx, width, height))
		setTimeout(&, Math.random! * 500 + 100) do fire!
	
	def frame
		ctx.clearRect(0, 0, width, height)
		for [key,firework] of fireworks
			fireworks.delete(key) if !firework.render!
		window.requestAnimationFrame(frame.bind(self))

	def mount
		if states and states.listen isa Function
			states.listen 'fireworks', do(state) 
				if state == 'on' and !active
					active = true
					fire!
				elif state == 'off' and active
					active = false

		fire!
		window.requestAnimationFrame(frame.bind(self))
		

	<self>