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
import {Painting} from './blocks/painting.imba'
import {Rarity} from './blocks/rarity.imba'
import {Hold} from './blocks/hold.imba'
# import {Roadmap} from './blocks/roadmap.imba'
# import {Roadmap} from './blocks/roadmap.imba'
import {Roadmap} from './blocks/roadmap.imba'
import {Future} from './blocks/future.imba'


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
		# <B02>
		<Buttons>
		<Painting>
		<Rarity>
		<Hold>
		<Roadmap>
		<Future>
		
		

imba.mount <App>