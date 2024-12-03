const files =	
	airplane:
		path: './assets/avif/rarity/airplane.avif'
		width: 779
		height: 958
		alt: 'Airplane'
	passport:
		path: './assets/avif/rarity/passport.avif'
		width: 779
		height: 958
		alt: 'Passport'
	seal:
		path: './assets/avif/rarity/seal.avif'
		width: 779
		height: 958
		alt: 'Seal'
	stamp:
		path: './assets/avif/rarity/stamp.avif'
		width: 779
		height: 958
		alt: 'Stamp'
	scissors:
		path: './assets/avif/rarity/scissors.avif'
		width: 779
		height: 958
		alt: 'Scissors'
	photo:
		path: './assets/avif/rarity/photo.avif'
		width: 779
		height: 958
		alt: 'Photo'

export tag Rarity

	<self.block>
		<div.header>
			<span> "THE RARER YOU ARE, THE MORE $TRUEs YOU GET"
		<div>
			css m:0 max-width:100% pos:relative # overflow:hidden overflow-y:auto 
			<div.text> "The rarity of all avatars will be revealed on Big Drop Day, and everyone will get their piece of $TRUEs according to their personal uniqueness. You'll literally be rewarded for being yourself!"
			<div>
				css pos:relative max-width:100% aspect-ratio: {files.passport.width / (files.passport.height)}
				<img src=files.passport.path loading="lazy" decoding="asynchronous" width="{files.passport.width}" height="{files.passport.height}" alt=files.passport.alt>
					css pos:absolute d:block zi:1 t:0% l:0% h:auto max-width:100% zi:0
				<img.lax20 src=files.photo.path loading="lazy" decoding="asynchronous" width="{files.photo.width}" height="{files.photo.height}" alt=files.photo.alt>
					css pos:absolute d:block zi:1 t:0% l:0% h:auto max-width:100% zi:0
				<img.lax16 src=files.scissors.path loading="lazy" decoding="asynchronous" width="{files.scissors.width}" height="{files.scissors.height}" alt=files.scissors.alt>
					css pos:absolute d:block zi:1 t:0% l:0% h:auto max-width:100% zi:0
				<img.lax12 src=files.seal.path loading="lazy" decoding="asynchronous" width="{files.seal.width}" height="{files.seal.height}" alt=files.seal.alt>
					css pos:absolute d:block zi:1 t:0% l:0% h:auto max-width:100% zi:0
				<img.lax4 src=files.stamp.path loading="lazy" decoding="asynchronous" width="{files.stamp.width}" height="{files.stamp.height}" alt=files.stamp.alt>
					css pos:absolute d:block zi:1 t:0% l:0% h:auto max-width:100% zi:0
						
				<img src=files.airplane.path loading="lazy" decoding="asynchronous" width="{files.airplane.width}" height="{files.airplane.height}" alt=files.airplane.alt>
					css pos:absolute d:block zi:1 t:0% l:0 h:auto max-width:100% zi:1
						transform:rotate(270deg)
						offset-path: ellipse(15% 32% at 35% 50.3%)
						offset-rotate: auto
						animation: move ease-in-out 15s infinite
						@keyframes 
							move
								0% offset-distance: 100% 
								100% offset-distance: 0%


			
		
			