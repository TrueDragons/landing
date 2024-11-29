import {timeout} from '../common.imba'
import {Image} from '../objects/image.imba'

const files = 
	body:
		path: './assets/avif/roadmap/catowl_body.avif'
		width: 124
		height: 161
		alt: 'Catowl body'
	lwing:
		path: './assets/avif/roadmap/catowl_lwing.avif'
		width: 124
		height: 161
		alt: 'Catowl left wing'
	rwing:
		path: './assets/avif/roadmap/catowl_rwing.avif'
		width: 124
		height: 161
		alt: 'Catowl right wing'


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
			css w:100% aspect-ratio:{files.body.width / files.body.height}
			<Image$rwing file=files.rwing>
				css pos:absolute w:100% h:auto 
			<Image$lwing file=files.lwing>
				css pos:absolute w:100% h:auto 
			<Image file=files.body>
				css pos:absolute w:100% h:auto 
