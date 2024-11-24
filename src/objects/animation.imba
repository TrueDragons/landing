export tag Animation
	file
	r
	g
	b
	range = 40
	ctx
	out
	top = {}
	bot = {}

	def frame
		# ctx.clearRect(0, 0, $canvas.width, $canvas.height)
		ctx.drawImage($video, 0, 0, $canvas.width, $canvas.height)

		const shot = ctx.getImageData(0, 0, $canvas.width, $canvas.height)
		const data = shot.data

		let i = 0
		while i < data.length
		# for i in [0 ... data.length] by 4
			const red = data[i]
			const green = data[i + 1]
			const blue = data[i + 2]
			# if  (red >= bot.r and red <= top.r) 
			# and (green >= bot.g and green <= top.g) 
			# and (blue >= bot.b and blue <= top.b)
			if green > 200 and blue < 100 and red < 100
				data[i + 3] = 0
			i += 4
		
		ctx.putImageData(shot, 0, 0)
		window.requestAnimationFrame(frame.bind(self))

	def mount
		ctx = $canvas.getContext('2d', { willReadFrequently: true })
		# out = $output.getContext('2d', { willReadFrequently: true })
		$video.addEventListener('play', do frame!)
		top = 
			r: Math.min(r + range, 255)
			g: Math.min(g + range, 255)
			b: Math.min(b + range, 255)
		bot = 
			r: Math.max(r - range, 0)
			g: Math.max(g - range, 0)
			b: Math.max(b - range, 0)

	<self>
		<div [aspect-ratio: {file.width / file.height}]>
			css pos: relative w:100%
			<video$video playsInline loop autoplay muted [aspect-ratio: {file.width / file.height}]>
				css pos:absolute zi:1 inset:0 w:100% h:100% o:0
				<source src=file.url type=file.type>
			<canvas$canvas width="{file.width}" height="{file.height}">
				css pos:absolute zi:2 inset:0 w:100% h:100%
			# <canvas$output width="{file.width}" height="{file.height}">
			# 	css pos:absolute zi:3 inset:0 w:100% h:100%