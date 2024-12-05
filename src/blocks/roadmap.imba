import {States} from '../states.imba'
let states = new States!

import {Image} from '../objects/image.imba'

import {Path} from '../objects/path.imba'
import {Straus} from '../objects/straus.imba'
import {Snowman} from '../objects/snowman.imba'
import {Snow} from '../objects/snow.imba'
import {Leaves} from '../objects/leaves.imba'
import {Catowl} from '../objects/catowl.imba'
import {Bird} from '../objects/bird.imba'
import {Firework} from '../objects/fireworks.imba'
import {Tablo} from '../objects/tablo.imba'
import {Garland} from '../objects/garland.imba'
import {Start} from '../objects/start.imba'
import {Finish} from '../objects/finish.imba'
import {Confetti} from '../objects/confetti.imba'
import {Traces} from '../objects/traces.imba'
import {Bottle} from '../objects/bottle.imba'

const files = 
	map:
		path: './assets/avif/roadmap/map.avif'
		width: 600
		height: 2532
		alt: 'Map'
	gifts:
		path: './assets/avif/roadmap/gifts.avif'
		width: 300
		height: 140
		alt: 'Gifts'
	festoon:
		path: './assets/avif/roadmap/festoon.avif'
		width: 98
		height: 497
		alt: 'Festoon'


export tag Roadmap
	<self.block>
		<div.header>
			<span> "DRAGON "
			<br>
			<span> "TRUE PATH"
		<div.text> "All you need are 5 real friends who know you well. Complete memetic personality test for each other by selecting the PFP mascot attributes that you think best match your friend. NO GUILT. Get your pleasure by pointing out all your friends’ pros and cons…"
		<div>
			css pos:relative mt:30px
			<Image file=files.map>
				css w:100% h:auto zi:-1
			<Path states=states>
				css pos:absolute  l:0 t:0% w:100% h:100% zi:0
			<Straus>
				css pos:absolute t:4% w:20% l:18%
			<Snowman>
				css pos:absolute zi:0 w:10% t:38% l:5%
			<Leaves>
				css pos:absolute t:4% w:100% l:0
			<Bird>
				css pos:absolute t:12% w:100% zi:0
			<Snow>
				css pos:absolute t:32% w:90% l:4% h:24% zi:1
			<Catowl states=states>
				css pos:absolute w:12% zi:3
			<Firework states=states> # states=states>
				css pos:absolute t:30% w:100% l:0% h:600px zi:2 # aspect-ratio: 0.5
			<Tablo states=states name='tablo1' main='Early Birds' dates="November-December 2024">
				css pos:absolute t:1% w:45% r:9%
			<Tablo states=states name='tablo2' flip=true main="MEME Test" dates="January-Fabruary 2025">
				css pos:absolute t:14% w:45% l:4% # t:18% w:24.41vw h:24.5vw l:22%
			<Tablo states=states name='tablo3' main='Big Drop' dates="March-April 2025">
				css pos:absolute t:32% w:45% r:5% # t:36% w:24.5vw h:24.5vw r:25%
			<Image file=files.gifts>
				css pos:absolute t:38% w:45% r:3% h:auto 
			<Image file=files.festoon>
				css pos:absolute t:31.6% w:9% r:22.8% h:auto 
			<Garland states=states>
				css pos:absolute t:31.4% w:43% r:6% h:auto 
			<Start states=states>
				css pos:absolute t:55% w:33% r:48% h:auto 
			<Finish states=states>
				css pos:absolute t:78% w:33% r:18% h:auto zi:2
			<Traces>
				css pos:absolute t:65% w:50% l:18% h:auto zi:0
			<Confetti states=states>
				css pos:absolute t:68% w:50% l:38% h:auto
			<Bottle states=states>
				css pos:absolute t:80% h:auto w:100%
			<Tablo states=states name='tablo4' main='RPG Game' dates="April-May 2025">
				css pos:absolute t:47% w:45% r:22% zi:2
			<Tablo states=states name='tablo5' flip=true main="Quests IRL" dates="May-June 2025">
				css pos:absolute t:83% w:45% l:7% zi:2
			