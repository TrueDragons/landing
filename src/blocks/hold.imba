import {images} from '../assets.imba'
import {Video} from '../objects/video.imba'
import {videos} from '../assets.imba'

export tag Hold
	css 
		.swing1
			animation: swing 6s infinite
			transform-origin: top center
		.swing2
			animation: swing 4s infinite
			transform-origin: top center

		@keyframes
			swing
				0% transform: rotate(0deg)
				10% transform: rotate(0deg)
				20% transform: rotate(5deg)
				40% transform: rotate(-5deg)
				100% transform: rotate(0deg)

	<self.block>
		<div.header>
			<span> "KEEP YOUR $TRUES, AND LIFE-CHANGING TREASURE IS YOURS"
			# <span.gray> "Step three:" 
			# <br>
			# <span> "Be like a "
			# <br>
			# <span.green> "dragon"
			# <br>
			# <span> "and hold" 
			# <br>
			# <span> "your " 
			# <span.green> "$true"
			
		
		<div.text> "Don’t worry about missing out on things — the only real loss is missing out on who you truly are. You don’t have to pick between money and self-discovery. Focus on yourself, and you’ll get both."
		<div>
			css d:hflex jc:center ai:center
			<img.swing1 src=images.poster1.url loading="lazy" decoding="asynchronous" width="{images.poster1.width}" height="{images.poster1.height}">
				css pos:relative zi:1 max-width:25% h:auto w:auto d:block mt:3rem
			<img.swing2 src=images.poster2.url loading="lazy" decoding="asynchronous" width="{images.poster2.width}" height="{images.poster2.height}">
				css pos:relative zi:1 max-width:25% h:auto w:auto d:block mt:3rem ml:5rem
		<Video file=videos.polygraph>
		# <video.video playsInline loop autoplay muted>
		# 	css aspect-ratio:1.1
		# 	<source src='assets/video/polygraph.mp4' type="video/mp4">