const characters = [
	{
		image: './assets/image/character0.avif'
	}
	{
		image: './assets/image/character1.avif'
		attribute: './assets/image/attribute1.avif'
		header: "Grumpy cat"
		text: 'Somewhere deeply inside you hate all this grown-up-life'
	}
	{
		image: './assets/image/character2.avif'
		attribute: './assets/image/attribute2.avif'
		header: "Trendy style"
		text: "You are definitely smart but can't miss any hype"
	}
	{
		image: './assets/image/character3.avif'
		attribute: './assets/image/attribute3.avif'
		header: "Hell cocktail of copium"
		text: "Sometimes it feels like you'll keep pretending everything is fine, even while lying in a coma"
	}
	{
		image: './assets/image/character4.avif'
		attribute: './assets/image/attribute4.avif'
		header: "Dogwifhat's hat"
		text: "Because you have the talent to look cool even in grandma's clothes"
	}
]

tag Attribute
	value
	active = false
	
	<self>
		css cursor:pointer of:hidden
			bxs:gray4 3px 2px 2px rd:14px w:10% # mb:1.5em w:80% py:1em px:1em w:100%
			background: rgb(243,247,246)
			background: linear-gradient(162deg, rgba(243,247,246,1) 0%, rgba(191,228,236,1) 50%, rgba(158,239,232,1) 100%)
		# <div> 
		# 	css w:25% h:auto l:0 t:0 rd:50% 2px solid aspect-ratio: {356 / 346} of:hidden mix-blend-mode:darken
		<img src=characters[value].attribute loading="lazy" decoding="asynchronous" width="{356}" height="{346}">
			css w:100% h:auto l:0 t:0 aspect-ratio:1 # object-fit:contain
		# <div> 
		# 	css d:vflex ml:30px
		# 	<span> characters[value].header
		# 		css ff:"Montserrat" fw:900 fs:24px ta:left lh:1.2em
		# 	<span> characters[value].text
		# 		css ff:"Montserrat" fw:400 fs:16px ta:left mt:1em

export tag Attributes
	character = 0

	<self.block>
		<div.header>
			<span> "WHAT’S YOUR "
			<br>
			<span> "FRIEND'S "
			<span.green> "VIBE"
			# <span.gray> "Step two: "
			# <br>
			# <span> "Gain "
			# <span.green> "$True "
			# <br>
			# <span> "depending"
			# <br>
			# <span> "on your "
			# <br>
			# <span.green> "rarity"
		<div>
			css pos:relative w:100% d:vflex ai:center mt:2em
			<div>
				css w:50% h:auto l:25% t:0 rd:50% bd:gray5 5px solid mt:5% aspect-ratio: {356 / 346} of:hidden
				<img src=characters[character].image loading="lazy" decoding="asynchronous" width="{356}" height="{346}">
					css w:100% h:auto l:0 t:0
			<div>
				css d:vflex w:50%
				<span> characters[character].header
					css ff:"Montserrat" fw:900 fs:24px lh:1.2em mt:1em
				<span> characters[character].text
					css ff:"Montserrat" fw:400 fs:16px mt:1em
			<div>
				css mt:2em d:hflex ai:center px:1em jc:center gap:2%
				<Attribute$att1 value=1 @click=(character=1; $att1.active=!$att1.active)>
				<Attribute$att2 value=2 @click=(character=2; $att2.active=!$att2.active)>	
				<Attribute$att3 value=3 @click=(character=3; $att3.active=!$att3.active)>	
				<Attribute$att4 value=4 @click=(character=4; $att4.active=!$att4.active)>
			

