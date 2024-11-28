const assets =	
	airplane:
		url: './assets/image/airplane.avif'
		width: 779
		height: 958
	passport:
		url: './assets/image/passport.avif'
		width: 779
		height: 958
	seal:
		url: './assets/image/seal.avif'
		width: 779
		height: 958
	stamp:
		url: './assets/image/stamp.avif'
		width: 779
		height: 958
	scissors:
		url: './assets/image/scissors.avif'
		width: 779
		height: 958
	photo:
		url: './assets/image/photo.avif'
		width: 779
		height: 958

export tag Rarity

	<self.block [of:visible]>
		<div.header>
			<span> "GET "
			<span.green> "$TRUE!"
			<br>
			<span> "AS MUCH AS "
			<span.green> "RARE"
			<br>
			<span> "YOU ARE…"
		<div>
			css m:0 max-width:100% pos:relative # overflow:hidden overflow-y:auto 
			<div.text> "Don’t worry about missing out on things — the only real loss is missing out on who you truly are. You don’t have to pick between money and self-discovery. Focus on yourself, and you’ll get both."
			# <div.header>
			# 	<span> "GET $TRUE! AS MUCH AS RARE YOUR PERSONALITY IS…"
			# 	# <span.gray> "Step two: "
			# 	# <br>
			# 	# <span> "Gain "
			# 	# <span.green> "$True "
			# 	# <br>
			# 	# <span> "depending"
			# 	# <br>
			# 	# <span> "on your "
			# 	# <br>
			# 	# <span.green> "rarity"
			# <div.text> "Don’t worry about missing out on things — the only real loss is missing out on who you truly are. You don’t have to pick between money and self-discovery. Focus on yourself, and you’ll get both."
			# 	css pos:absolute inset:0 transform:translateZ(0)
			<div>
				css pos:relative max-width:100% aspect-ratio: {assets.passport.width / (assets.passport.height)}
				# bgi:{images.passport.bg} background-size:cover background-repeat: no-repeat max-width:100% aspect-ratio: {images.passport.width / images.passport.height}
				<img src=assets.passport.url loading="lazy" decoding="asynchronous" width="{assets.passport.width}" height="{assets.passport.height}">
					css pos:absolute d:block zi:1 t:0% l:0% h:auto max-width:100% zi:0
				<img.lax20 src=assets.photo.url loading="lazy" decoding="asynchronous" width="{assets.photo.width}" height="{assets.photo.height}">
					css pos:absolute d:block zi:1 t:0% l:0% h:auto max-width:100% zi:0
				<img.lax16 src=assets.scissors.url loading="lazy" decoding="asynchronous" width="{assets.scissors.width}" height="{assets.scissors.height}">
					css pos:absolute d:block zi:1 t:0% l:0% h:auto max-width:100% zi:0
				<img.lax12 src=assets.seal.url loading="lazy" decoding="asynchronous" width="{assets.seal.width}" height="{assets.seal.height}">
					css pos:absolute d:block zi:1 t:0% l:0% h:auto max-width:100% zi:0
				<img.lax4 src=assets.stamp.url loading="lazy" decoding="asynchronous" width="{assets.stamp.width}" height="{assets.stamp.height}">
					css pos:absolute d:block zi:1 t:0% l:0% h:auto max-width:100% zi:0
						
				
				<img src=assets.airplane.url loading="lazy" decoding="asynchronous" width="{assets.airplane.width}" height="{assets.airplane.height}">
					css pos:absolute d:block zi:1 t:0% l:0 h:auto max-width:100% zi:1
						transform:rotate(270deg)
						offset-path: ellipse(15% 32% at 35% 50.3%)
						offset-rotate: auto
						animation: move ease-in-out 15s infinite
						@keyframes 
							move
								0% offset-distance: 100% 
								100% offset-distance: 0%


			
		
			