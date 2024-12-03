import {Video} from '../objects/video.imba'
import {Attributes} from '../objects/attributes.imba'

const files =
	video:
		path: './assets/mp4/painter.mp4'
		type: 'video/mp4'
		width: 400
		height: 400

export tag Friends
	<self.block>
		<div.header>
			<span> "MAKE MUTUAL PERSONALITY FEEDBACKS WITH 5 FRIENDS"
		<div.text> "All you need are five close mates who truly know you. Complete memetic personality test for each other by selecting the PFP mascot attributes that you think best match your friend."
		<Attributes>
			css mb:4%
		<div.text> "On a base of five portraits, you can create your one resulting unique avatar — a humorous yet insightful psychological profile inspired by the 12 archetypes theory of Carl Gustav Jung. "
		<Video file=files.video>
		<div.text> "Find out your strengths, weaknesses, and unique superpowers in the eyes of others. This will all matter for future activities..."
		