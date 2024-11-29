import {Video} from '../objects/video.imba'
import {Image} from '../objects/image.imba'

const files = 
	video:
		path: './assets/mp4/polygraph.mp4'
		type: 'video/mp4'
		width: 1080
		height: 924
	poster1:
		path: './assets/avif/hold/poster1.avif'
		width: 150
		height: 258
		alt: 'Hold your $True poster'
	poster2:
		path: './assets/avif/hold/poster2.avif'
		width: 150
		height: 207
		alt: 'True dragon poster'


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
			<span> "LIFE-CHANGING"
			<br>
			<span> "TREASURE FOR"
			<br>
			<span.green> "EVERY "
			<span> "DRAGON"
			
		
		<div.text> "Don’t worry about missing out on things — the only real loss is missing out on who you truly are. You don’t have to pick between money and self-discovery. Focus on yourself, and you’ll get both."
		<div>
			css d:hflex jc:center ai:center
			<Image.swing1 file=files.poster1>
				css pos:relative zi:1 max-width:25% h:auto w:auto d:block mt:3rem
			<Image.swing2 file=files.poster2>
				css pos:relative zi:1 max-width:25% h:auto w:auto d:block mt:3rem ml:5rem
		<Video file=files.video>
