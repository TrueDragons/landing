import {images} from '../assets.imba'
import {timeout} from '../common.imba'

tag Flash

	def clear
		self.flags.remove('init').remove('blink').remove('on').remove('off')

	def blink
		clear!
		self.flags.add('blink')
		await timeout(1000)

	def on
		clear!
		self.flags.add('on')
		await timeout(500)
		
	def off
		clear!
		self.flags.add('off')
		await timeout(500)
	

	css
		&.blink 
			animation: blink 1000ms linear forwards
			@keyframes
				blink
					30% o:0
					50% o:1
					52% o:0
					70% o:1
					72% o:0
					100% o:1
		&.on animation: on 500ms linear forwards
			@keyframes
				on
					to o:1
		&.off animation: off 500ms linear forwards
			@keyframes
				off
					to o:0
		&.init 
			o:0


	<self.init>
		css w:2.5% aspect-ratio:1
		<div>
			css bg:#FFBC33 w:150% h:150% pos:absolute rd:50%
				filter: blur(5px)
		<div>
			css bg:#FFBC33 w:110% h:110% pos:absolute rd:50%
				filter: blur(1px)
		<div>
			css bg:#FFE731 w:60% h:60% pos:absolute l:20% t:20% rd:50%
				filter: blur(0.5px)
		

export tag Garland
	lamps = []
	effects = ['blink', 'majorblink', 'runner1', 'runner2']
	states
	active = false
	
	def lights on = true
		let promises = []
		if on
			for lamp, idx in lamps
				promises.push lamp.on!
		else
			for lamp in lamps
				promises.push lamp.off!
		await Promise.all(promises)	
	
	def blink count = 0
		if count == 0
			await lights(true)
			await blink(count + 1)
		elif count < 3
			let promises = []
			promises.push lamps[Math.floor(Math.random! * lamps.length)].blink!
			await timeout(200 * Math.random!)
			promises.push lamps[Math.floor(Math.random! * lamps.length)].blink!
			await timeout(200 * Math.random!)
			promises.push lamps[Math.floor(Math.random! * lamps.length)].blink!
			await timeout(200 * Math.random!)
			promises.push lamps[Math.floor(Math.random! * lamps.length)].blink!
			await Promise.all(promises)	
			await blink(count + 1)

	def runner count = -1, forward = true
		if count == -1
			await lights(false)
			await runner(count + 1, forward)
		elif count < 24
			const current = forward ? count : lamps.length - count - 1
			lamps[current].on!
			setTimeout(&, 200) do lamps[current].off!
			await timeout(20)
			await runner(count + 1, forward)

	def majorblink
		await lights(false)
		await timeout(10 * Math.random!)
		await lights(true)
		await timeout(20 * Math.random!)
		await lights(false)

	def effect name = ''
		if !active
			lights(false)
			return 

		if !name then name = effects[Math.floor(Math.random! * effects.length)]
		
		if name is 'blink'
			await blink!
		elif name is 'runner1'
			await runner(-1,true)
		elif name is 'runner2'
			await runner(-1,false)
		elif name is 'majorblink'
			await majorblink!
		
		await timeout(500)
		effect!

	def mount
		lamps = [
			$t1, $b1, $t2, $b2, $t3, $b3, $t4, $b4, $t5, $b5, $t6, $b6,
			$t7, $b7, $t8, $b8, $t9, $b9, $t10, $b10, $t11, $b11, $t12, $b12]

		if states and states.listen isa Function
			states.listen 'garland', do(state) 
				if state == 'on' and !active
					active = true
					effect('blink')
				elif state == 'off' and active
					active = false

	<self>
		<div [aspect-ratio: {images.garland.width / images.garland.height}]>
			css w:100% h:auto pos:relative 
			<img src=images.garland.url loading="lazy" decoding="asynchronous" width="{images.garland.width}" height="{images.garland.height}">
				css pos:absolute w:100% h:auto t:-6% l:0
			<Flash$b1>
				css pos:absolute l:-2% t:90% scale-y:110% scale-x:80% rotate:90deg
			<Flash$t1>
				css pos:absolute l:2% t:83% scale-y:110% scale-x:80%
			<Flash$b2>
				css pos:absolute l:6.8% t:94% scale-y:110% scale-x:80% rotate:10deg
			<Flash$t2>
				css pos:absolute l:7% t:78% scale-y:100% scale-x:80% rotate:100deg
			<Flash$b3>
				css pos:absolute l:12% t:66% scale-y:100% scale-x:80% # rotate:00deg
			<Flash$t3>
				css pos:absolute l:10.8% t:51% scale-y:100% scale-x:80% rotate:100deg
			<Flash$t4>
				css pos:absolute l:12% t:20% scale-y:80% rotate:-120deg
			<Flash$b4>
				css pos:absolute l:14% t:31% scale-x:80% # scale-x:100% # rotate:180deg
			<Flash$t5>
				css pos:absolute l:20% t:12% scale-y:80% rotate:-130deg
			<Flash$b5>
				css pos:absolute l:19.5% t:24% scale-x:80% # scale-x:100% # rotate:180deg
			<Flash$t6>
				css pos:absolute l:28% t:14% scale-y:70% rotate:45deg
			<Flash$b6>
				css pos:absolute l:28% t:26% scale-y:80% scale-x:110% rotate:-30deg
			<Flash$t7>
				css pos:absolute l:36% t:17% scale-y:70% rotate:45deg
			<Flash$b7>
				css pos:absolute l:36% t:29% scale-y:80% scale-x:110% rotate:-30deg
			<Flash$t8>
				css pos:absolute l:55% t:15% scale-y:70% rotate:-65deg
			<Flash$b8>
				css pos:absolute l:55% t:29% scale-y:80% scale-x:110% rotate:30deg
			<Flash$t9>
				css pos:absolute l:61% t:11% scale-y:70% rotate:-45deg
			<Flash$b9>
				css pos:absolute l:60% t:24% scale-y:80% scale-x:110% rotate:30deg
			<Flash$t10>
				css pos:absolute l:67.4% t:13.6% scale-y:90% scale-x:120% rotate:-25deg
			<Flash$b10>
				css pos:absolute l:68% t:25% scale-y:90% scale-x:110% rotate:60deg
			<Flash$t11>
				css pos:absolute l:90% t:64% scale-y:90% scale-x:120% rotate:-25deg
			<Flash$b11>
				css pos:absolute l:87% t:71% scale-y:90% scale-x:110% rotate:90deg
			<Flash$t12>
				css pos:absolute l:96% t:64% scale-y:90% scale-x:120% rotate:-80deg
			<Flash$b12>
				css pos:absolute l:93% t:80% scale-y:90% scale-x:110% rotate:70deg
