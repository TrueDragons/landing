# let isSafari = window.safari !== undefined

import {Model} from '../objects/model.imba'
import {Easel} from '../objects/easel.imba'
import {Artist} from '../objects/artist.imba'

import {Straus} from '../objects/straus.imba'

const gifs =
	model: 'assets/model.gif'
	easel: 'assets/easel.gif'
	artist: 'assets/artist.gif'

export tag Painting
	pos=200
	vis = {top:false, bot:false}
	
	def topvis value = true
		vis.top = value
		pos = -200 if !vis.top and vis.bot
		pos = 0 if vis.top and vis.bot
		imba.commit!
	
	def botvis value = true
		vis.bot = value
		pos = 200 if vis.top and !vis.bot
		pos = 0 if vis.top and vis.bot
		imba.commit!
		
		# pos = -100 if !vis.top and vis.bottom
		# console.log 'tophide'

	<self.block>
		<div.header>
			<span.gray> "Step one:"
			<br>
			<span> "Get "
			<span.green> " five "
			<span> "reviews from "
			<span.green> "your friends"
		<div.text> "All you need are 5 real friends who know you well. Complete memetic personality test for each other by selecting the PFP mascot attributes that you think best match your friend. NO GUILT. Get your pleasure by pointing out all your friends’ pros and cons…"
		#	css zi:-1
		# <img src=video041>
		# 	css w:300px
		<div @intersect.out.topvis(false) @intersect.in.topvis(true)>
		<div>
			css pos:relative max-width:400px h:min(90vw,55vh, 400px) ml:auto mr:auto w:100%
			# <div [mt:{pos}%]>
			#	css ead:1.5s
			#	# css pos:absolute ead:1.5s zi:2 # t:100% 
			#	# <Straus>
			<img [mt:{pos}%] src=gifs.model>
				css ead:1.2s w:50% t:12% l:0% pos:absolute # max-width:200px
			<img src=gifs.easel>
				css ead:1.8s w:50% t:25% r:20% pos:absolute # max-width:200px
			<img src=gifs.artist>
				css ead:2s w:50% t:40% r:0% pos:absolute # max-width:200px
			# <div [t:{pos}%]>
			# 	css pos:absolute ead:1s zi:2 l:50 max-width:1000px w:600px
			# 	<Easel>
			# <div [t:{pos}%]>
			# 	css pos:absolute ead:0.5s zi:2 l:100
			# 	<Artist>
			# <div @intersect.out.topvis(false) @intersect.in.topvis(true)>
			# 	css pos:absolute w:100% h:1px bgc:gray4 t:48%
			# <div @intersect.out.botvis(false) @intersect.in.botvis(true)>
			# 	css pos:absolute w:100% h:1px bgc:gray4 t:52%
		# <Easel>
		# <Artist>
		<div @intersect.out.botvis(false) @intersect.in.botvis(true)>
		<div.text> "It’s a chance to find out how other people perceive you as a person — how you actually act with others, your intelligence and creativity powers, the way you behave with close mates and influence on other people."