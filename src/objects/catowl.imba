import {images} from '../assets.imba'
import {timeout} from '../common.imba'

export tag Catowl
	states
	tablo = 1
	last = 1
	flying = false

	css
		&.tablo1
			t:-2% l:68%
		&.tablo2
			animation: tablo2 2s linear forwards origin: 100% 50%
			@keyframes
				tablo2
					0%   t:-2% l:68% transform: scaleY(1) 
					10%  t:-2% l:68% transform: scaleY(1.1)
					90%	 t:11% l:14% transform: scaleY(1.1)
					100% t:11% l:14% transform: scaleY(1)
		&.tablo3
			animation: tablo3 2s linear forwards origin: 100% 50%
			@keyframes
				tablo3
					0%   t:11% l:14% transform: scaleY(1)   scaleX(-1)
					10%  t:11% l:14% transform: scaleY(1.1) scaleX(-1)
					90%	 t:29% l:46% transform: scaleY(1.1) scaleX(-1)
					100% t:29% l:46% transform: scaleY(1)   scaleX(-1)
		&.tablo4
			animation: tablo4 2s linear forwards origin: 100% 50%
			@keyframes
				tablo4
					0%   t:29% l:46% transform: scaleY(1)
					10%  t:29% l:46% transform: scaleY(1.1)
					90%	 t:44% l:38% transform: scaleY(1.1)
					100% t:44% l:38% transform: scaleY(1)
		&.tablo5
			animation: tablo5 5s linear forwards origin: 100% 50%
			@keyframes
				tablo5
					0%   t:44% l:38% transform: scaleY(1)
					10%  t:44% l:38% transform: scaleY(1.1)
					90%	 t:80% l:18% transform: scaleY(1.1)
					100% t:80% l:18% transform: scaleY(1)

		.lwing
			animation: flying 0.5s linear infinite origin: 55% 25%
			@keyframes
				flying
					0%   transform: rotate(0deg)
					50%  transform: rotate(-120deg)
					100% transform: rotate(0deg)
		.rwing
			animation: flying 0.5s linear infinite origin: 20% 30%
			@keyframes
				flying
					0%   transform: rotate(0deg)
					50%  transform: rotate(120deg)
					100% transform: rotate(0deg)

	def fly
		if flying 
			if last > tablo
				await timeout(1000)
				fly!
			return

		flying = true
		tablo += 1
		self.flags.add("tablo{tablo}")

		for i in [1 ... 5] when i != tablo
			self.flags.remove("tablo{i}")
		
		$lwing.flags.add('lwing')
		$rwing.flags.add('rwing')
		let time = tablo == 5 ? 5000 : 2000
		await timeout(time)
		$lwing.flags.remove('lwing')
		$rwing.flags.remove('rwing')
		flying = false
		if last > tablo
			fly!

	def mount
		if states and states.listen isa Function
			states.listen 'catowl', do(state) 
				if last < state
					last = state
					fly!

	<self.tablo1>
		<div>
			css w:100% aspect-ratio:{images.catowl_body.width / images.catowl_body.height}
			<img$rwing src=images.catowl_rwing.url loading="lazy" decoding="asynchronous" width="{images.catowl_rwing.width}" height="{images.catowl_rwing.height}">
				css pos:absolute w:100% h:auto 
			<img$lwing src=images.catowl_lwing.url loading="lazy" decoding="asynchronous" width="{images.catowl_lwing.width}" height="{images.catowl_lwing.height}">
				css pos:absolute w:100% h:auto 
			<img src=images.catowl_body.url loading="lazy" decoding="asynchronous" width="{images.catowl_body.width}" height="{images.catowl_body.height}">
				css pos:absolute w:100% h:auto 
				#	animation: straus_body 3s infinite
