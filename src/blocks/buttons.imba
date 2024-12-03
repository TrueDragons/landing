
import {Video} from '../objects/video.imba'

const files = 
	video:
		path: './assets/mp4/buttons.mp4'
		type: 'video/mp4'
		width: 1080
		height: 1330


export tag Buttons
	<self.block>
		<div.header>
			<span> "FIND YOURSELF AND"
			<br>
			<span> "YOU WON’T MISS ANYTHING "
		<div.text> "Don’t worry about missing out on things — the only real loss is missing out on who you truly are. You don’t have to pick between money and self-discovery. Focus on yourself, and you’ll get both."
		<Video file=files.video>
