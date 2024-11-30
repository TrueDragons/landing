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

tag Attribute
	value
	active = false
	
	css 
		&.active
			bxs:red10 3px 2px 2px
		&.passive
			bxs:gray4 3px 2px 2px
	<self .active=active .passive=!active>
		css cursor:pointer of:hidden
			rd:14px w:10% # mb:1.5em w:80% py:1em px:1em w:100%
			background: rgb(243,247,246)
			background: linear-gradient(162deg, rgba(243,247,246,1) 0%, rgba(191,228,236,1) 50%, rgba(158,239,232,1) 100%)
		<img src=characters[value].attribute loading="lazy" decoding="asynchronous" width="{356}" height="{346}" alt=characters[value].header>
			css w:100% h:auto l:0 t:0 aspect-ratio:1 # object-fit:contain

export tag Attributes
	character = 0
	atts = [$att1, $att2, $att3, $att4]

	def activate count = 1
		let prev
		for att, idx in atts
			prev = idx + 1 if att.active
			att.active=false

		if prev != count
			atts[count - 1].active = true
		character = count

	<self.block>
		<div.header>
			<span> "WHAT’S YOUR "
			<br>
			<span> "FRIEND'S "
			<span.green> "VIBE"
		<div>
			css pos:relative w:100% d:vflex ai:center mt:2em
			<div>
				css w:50% h:auto l:25% t:0 rd:50% bd:gray5 5px solid mt:5% aspect-ratio: {356 / 346} of:hidden
				<img src=characters[character].image loading="lazy" decoding="asynchronous" width="{356}" height="{346}" alt=characters[character].header>
					css w:100% h:auto l:0 t:0
			<div>
				css d:vflex w:50%
				<span> characters[character].header
					css ff:"Montserrat" fw:900 fs:24px lh:1.2em mt:1em
				<span> characters[character].text
					css ff:"Montserrat" fw:400 fs:16px mt:1em
			<div>
				css mt:2em d:hflex ai:center px:1em jc:center gap:2%
				<Attribute$att1 value=1 @click=activate(1)>
				<Attribute$att2 value=2 @click=activate(2)>	
				<Attribute$att3 value=3 @click=activate(3)>	
				<Attribute$att4 value=4 @click=activate(4)>
			

