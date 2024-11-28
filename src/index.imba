import './global.imba'

# @ts-ignore
# import map_back from './images/map_back.webp'
# @ts-ignore
# import map_frame from './images/map_frame.webp'
# @ts-ignore
# import straus from './assets/straus.webm'

import {Hero} from './blocks/hero.imba'
# import {B02} from './blocks/02.steps.imba'
import {Buttons} from './blocks/buttons.imba'
import {Steps} from './blocks/steps.imba'
import {Friends} from './blocks/friends.imba'
import {Attributes} from './blocks/attributes.imba'

import {Rarity} from './blocks/rarity.imba'
import {Hold} from './blocks/hold.imba'
# import {Roadmap} from './blocks/roadmap.imba'
# import {Roadmap} from './blocks/roadmap.imba'
import {Roadmap} from './blocks/roadmap.imba'
import {Future} from './blocks/future.imba'

# import {Fireworks} from './objects/fireworks.imba'
import {videos} from './assets.imba'

import {lax} from './common.imba'
# import {lax} from 'lax.js'

window.onload = do 
	lax.init!
	lax.addDriver('scrollY', do return window.scrollY)
	lax.addElements '.lax20',
			scrollY:
				translateY: [
					["elInY", "elCenterY", "elOutY"]
					['screenHeight/20', 0, '-screenHeight/20']
				]
	lax.addElements '.lax16',
			scrollY:
				translateY: [
					["elInY", "elCenterY", "elOutY"]
					['screenHeight/16', 0, '-screenHeight/16']
				]
	lax.addElements '.lax12',
			scrollY:
				translateY: [
					["elInY", "elCenterY", "elOutY"]
					['screenHeight/12', 0, '-screenHeight/12']
				]
	lax.addElements '.lax8',
			scrollY:
				translateY: [
					["elInY", "elCenterY", "elOutY"]
					['screenHeight/8', 0, '-screenHeight/8']
				]
	lax.addElements '.lax4',
			scrollY:
				translateY: [
					["elInY", "elCenterY", "elOutY"]
					['screenHeight/4', 0, '-screenHeight/4']
				]

tag App
	
	# def mount
	# 	let resize = do 
	# 		document.documentElement.style.setProperty('--app-height', "{window.innerHeight}px")
	# 		console.log "{window.innerHeight}px"
	# 	# window.scrollTo(0,1)
	# 	# window.addEventListener('resize', resize)
	# 	window.onresize = do resize!
	# 	# document.body.height = window.innerHeight
	# 	# console.log document.body.height
	# 	resize!
		

	<self>
		<Hero>
		
		<Buttons>
		<Steps>
		<Friends>
		<Attributes>
		<Rarity>
		<Hold>
		<Roadmap>
		<Future>
		
		

imba.mount <App>