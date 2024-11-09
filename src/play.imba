export tag Play < canvas
	ratio = 0
	src = ''
	frames = {
		width: 0, 
		height: 0, 
		count: 0, 
		cols: 0, 
		active:0, 
		next: do 
			this.active++
			this.active = 0 if this.active > this.count
			this.active = this.count if this.active < 0
		prev: do 
			this.active--
			this.active = this.count if this.active < 0
		sprite: do
			const row = Math.floor(this.active / this.cols)
			const col = this.active % this.cols
			return {x: col * this.width}

		sheet: <ImageBitmap>
	}
	# sprites = {}
	ctx = getContext('2d')
	visible = false
	prev = 0
	first = false
	started = false

	# ----------------------------------------------------------
	def sprite i = 0
		i = frames.count if i > frames.count
		i = 0 if i < 0
		const line = Math.floor(i / frames.cols)

	# ----------------------------------------------------------
	def frame
		window.requestAnimationFrame(frame.bind(self)) if visible
		# return if prev == ratio or !sprites.sheet
		# prev = ratio

		return if !ctx 

		frames.active++
		if frames.active > frames.count
			frames.active = 0
			return

		ctx.clearRect(0, 0, frames.width, frames.height)

		const line = Math.floor(frames.active / frames.cols)
		const row = 
		const sprite = 
			x: 
			y: 
		# return if ratio == 0 and !first
		# let frame = sprites.count * ratio
		# frame = 1 if ratio == 0 and first
		# const sprite = json.frames[Math.ceil(frame)]
		ctx.drawImage(frames.sheet, sprite.x, sprite.y, frames.width, frames.height, sprite.x, sprite.y, frames.width, frames.height)


	# ----------------------------------------------------------
	def mount
		const image = new Image
		image.src = src

		const observer = new window.IntersectionObserver do |[entry]| 
			visible = entry.isIntersecting
			# if !started
			# 	started = true
			# 	prev = -1
			window.requestAnimationFrame(frame.bind(self)) if visible

		image.addEventListener 'load', do
			window.createImageBitmap(image).then do |bitmap| 
				frames.sheet = bitmap
				observer.observe(self)
					
	# ----------------------------------------------------------
	def render
		<self>
			css
				w: 100% h: 100vh