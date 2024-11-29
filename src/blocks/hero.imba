import {Video} from '../objects/video.imba'
import {Image} from '../objects/image.imba'

export const files = 	
	logo: 
		path: './assets/svg/logo.svg'
		width: 231.5
		height: 71.1
		alt: "True Dragons"
	telegram: 
		path: './assets/svg/telegram.svg'
		width: 32
		height: 32
		alt: "Telegram"
	twitter: 
		path: './assets/svg/twitter.svg'
		width: 32
		height: 32
		alt: "Twitter"
	video:
		path: './assets/mp4/overview.mp4'
		type: 'video/mp4'
		width: 1080
		height: 1328


export tag Hero
	<self.block [mt:0]>
		<div>
			css d:hflex h:32px ai:center mt:15px px:2rem
			<Image file=files.logo>
				css w:100px
			<span [ml:20px]> "version 0.4.2"
			<Image file=files.telegram>
				css ml:auto mr:15px o@hover:0.5 cursor:pointer ead:0.5s
			<Image file=files.twitter>
				css o@hover:0.5 cursor:pointer ead:0.5s
		<div.header [mt:5vh]>
			<span> "Feeling "
			<br>
			<span.green> "lost"
			<span> "?"
		<Video file=files.video>
		