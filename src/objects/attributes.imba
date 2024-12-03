import {timeout} from '../common.imba'

const characters = [
	{
		image: './assets/avif/attributes/character0.avif'
		header: "Choose attribute"
		text: 'Choose the attribute that mostly describes your friend'
	}
	{
		image: './assets/avif/attributes/character1.avif'
		attribute: './assets/avif/attributes/attribute1.avif'
		header: "Grumpy cat"
		text: 'Somewhere deeply inside you hate all this grown-up-life'
	}
	{
		image: './assets/avif/attributes/character2.avif'
		attribute: './assets/avif/attributes/attribute2.avif'
		header: "Trendy style"
		text: "You’re definitely smart but can't ignore any hype"
	}
	{
		image: './assets/avif/attributes/character3.avif'
		attribute: './assets/avif/attributes/attribute3.avif'
		header: "Hell cocktail of copium"
		text: "You’ll keep pretending everything is fine, even while lying in coma"
	}
	{
		image: './assets/avif/attributes/character4.avif'
		attribute: './assets/avif/attributes/attribute4.avif'
		header: "Dogwifhat's hat"
		text: "Because you have the talent to look cool even in grandma's clothes"
	}
]

const button = 
	active: 'url(./assets/avif/attributes/active.avif)'
	passive: 'url(./assets/avif/attributes/passive.avif)'

tag Button
	value
	active = false
	
	<self [bgi: {active ? button.active : button.passive}]>
		css cursor:pointer of:hidden aspect-ratio:1 bgs:contain
		<img src=characters[value].attribute loading="lazy" decoding="asynchronous" width="{120}" height="{120}" alt=characters[value].header>
			css w:60% h:auto l:0 t:0 aspect-ratio:1 d:block m:auto mt:20%

export tag Attributes
	character = 0
	buts = [null, $but1, $but2, $but3, $but4]
	flipped = false
	flipping = false
	clicked = false

	def activate count = 0
		clicked = true
		return if flipping
		flipping = true

		if count == character
			buts[character].active = false if character
			character = 0
		else
			buts[character].active = false if character
			character = count
			buts[character].active = true if character
			

		if flipped
			$front.src = characters[character].image
			$card.flags.remove('flip')
		else 
			$back.src = characters[character].image
			$card.flags.add('flip')
			
		await timeout(500)
		flipped = !flipped
		flipping = false
		
	def setup 
		$front.src = characters[0].image
		$back.src = characters[0].image

	def shake
		return if clicked
		let num = Math.floor(Math.random! * (buts.length - 1) + 1)
		let button = buts[num]
		button.flags.add('shake')
		await timeout(900)
		button.flags.remove('shake')
		await timeout(2000)
		shake!

	def mount
		shake!

	css	
		.flip transform:rotateY(180deg)
		.shake
			animation: 0.3s shake 3
			@keyframes shake
				0% transform: rotate(0deg)
				25% transform: rotate(5deg)
				50% transform: rotate(0deg)
				75% transform: rotate(-5deg)
				100% transform: rotate(0deg)

	<self>		
		<div>
			css pos:relative w:100% d:vflex ai:center mt:2em perspective:350px
			<div$card>
				css w:70% max-width:300px pos:relative h:auto aspect-ratio: {300 / 320} transform-style: preserve-3d origin: center transition:transform 0.5s
				<img$front loading="lazy" decoding="asynchronous" width="{300}" height="{320}" alt="Dragon attribute">
					css w:100% pos:absolute h:auto l:0 t:0 transform:rotateY(0deg) backface-visibility: hidden zi:0
				<img$back loading="lazy" decoding="asynchronous" width="{300}" height="{320}" alt="Dragon attribute">
					css w:100% pos:absolute h:auto l:0 t:0 transform: rotateY(-180deg) backface-visibility: hidden zi:2
			<div>
				css d:vflex w:100%
				<span> characters[character]..header
					css ff:"Handee" fw:900 fs:26px lh:1.2em mt:1em tt:uppercase
				<span> characters[character]..text
					css ff:"Montserrat" fw:400 fs:16px mt:1em w:50% ml:auto mr:auto
			<div>
				css mt:2em d:hflex ai:center px:1em jc:center gap:0
				<Button$but1 value=1 @click=activate(1)>
				<Button$but2 value=2 @click=activate(2)>	
				<Button$but3 value=3 @click=activate(3)>	
				<Button$but4 value=4 @click=activate(4)>
			

