import {images} from '../assets.imba'

export tag Rarity
	<self.block>
		<div.header>
			<span> "THE RARER YOU ARE THE MORE $TRUEs YOU GET"
			# <span.gray> "Step two: "
			# <br>
			# <span> "Gain "
			# <span.green> "$True "
			# <br>
			# <span> "depending"
			# <br>
			# <span> "on your "
			# <br>
			# <span.green> "rarity"
		<div.text> "Don’t worry about missing out on things — the only real loss is missing out on who you truly are. You don’t have to pick between money and self-discovery. Focus on yourself, and you’ll get both."
		<div>
			css pos:relative max-width:100% aspect-ratio: {images.passport.width / images.passport.height} # bgi:{images.passport.bg} background-size:cover background-repeat: no-repeat max-width:100% aspect-ratio: {images.passport.width / images.passport.height}
			<img src=images.passport.url loading="lazy" decoding="asynchronous" width="{images.passport.width}" height="{images.passport.height}">
				css pos:absolute d:block zi:1 t:0 l:0 h:auto max-width:100% zi:0
			
			<img src=images.airplane.url loading="lazy" decoding="asynchronous" width="{images.airplane.width}" height="{images.airplane.height}">
				css pos:absolute d:block zi:1 t:0 l:0 h:auto max-width:100% zi:1 transform:rotate(270deg)
					# offset-path: path("M 310,260 T 310,180,170,110,150,40,400,100,340,320,100,240,270,80,470,320,310,310 Z")
					offset-path: ellipse(15% 35% at 35%)
					offset-rotate: auto
					animation: move ease-in-out 15s infinite
					@keyframes 
						move
							0% offset-distance: 100% 
							20% offset-distance: 100%
							100% offset-distance: 0%


			
		
			