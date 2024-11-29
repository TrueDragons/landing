import './global.imba'

import {Hero} from './blocks/hero.imba'
import {Buttons} from './blocks/buttons.imba'
import {Steps} from './blocks/steps.imba'
import {Friends} from './blocks/friends.imba'
import {Attributes} from './blocks/attributes.imba'
import {Rarity} from './blocks/rarity.imba'
import {Hold} from './blocks/hold.imba'
import {Roadmap} from './blocks/roadmap.imba'
import {Future} from './blocks/future.imba'

tag App
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