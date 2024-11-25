import {svgs} from '../assets.imba'
import {Video} from '../objects/video.imba'
import {videos} from '../assets.imba'

export tag Hero
	<self.block [mt:0]>
		<div>
			css d:hflex h:32px ai:center mt:15px px:2rem
			<img src=svgs.logo>
				css w:100px
			<span [ml:20px]> "version 0.3.0"
			<img src=svgs.telegram>
				css ml:auto mr:15px o@hover:0.5 cursor:pointer ead:0.5s
			<img src=svgs.twitter>
				css o@hover:0.5 cursor:pointer ead:0.5s
		<div.header [mt:5vh]>
			<span> "FEELING LOST?"
			# <span.green> "lost"
			# <span> "?"
			# <br>
			# <span> "Get "
			# <span.green> "$True"
			# <span> "!"
		<Video file=videos.overview>
		# <video.video playsInline loop autoplay muted>
		# 	css aspect-ratio:0.8133
		# 	<source src='assets/video/overview.mp4' type="video/mp4">
		