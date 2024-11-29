global css
	html
		overflow-x:hidden
		overscroll-behavior: none
		scroll-behavior: smooth
		max-width: 600px
		m:auto
		# @lt-xl fs:1rem
		# @lt-md fs:0.85rem
		# @lt-sm fs:0.7rem
		# @lt-xs fs:0.55rem
	body
		m: 0
		p: 0
		bgc: #CFEAF8 # #d2edf8
		ta:center
	.block
		d:vflex 
		min-width:230px
		of:hidden
		mt: 10vh
	.header
		ff:"Sigmar One" fw:normal tt:uppercase fs:2.4rem lh:2rem # fs:4vh lh:5dex
		c:white ta:center
		ts: -2px 2px 0px #0f0f0f text-stroke: 1px #0f0f0f -webkit-text-stroke: 1px #0f0f0f
		px:1rem
	.green
		c:#97d666
	.gray
		c:gray3 fs:1.5rem ts:none
	.text
		ff:"Montserrat" fw:normal fs:16px ta:left
		c:#343434
		mt:5%
		px:1rem
		ml: auto mr: auto


window.onload = do 
	const lax = require('lax.js')
	lax.init!
	lax.addDriver('scrollY', do return window.scrollY)
	lax.addElements '.lax20',
			scrollY:
				translateY: [
					["elInY", "elCenterY", "elOutY"]
					['screenHeight/20', 0, '-screenHeight/20']
				]
	lax.addElements '.lax16',
			scrollY:
				translateY: [
					["elInY", "elCenterY", "elOutY"]
					['screenHeight/16', 0, '-screenHeight/16']
				]
	lax.addElements '.lax12',
			scrollY:
				translateY: [
					["elInY", "elCenterY", "elOutY"]
					['screenHeight/12', 0, '-screenHeight/12']
				]
	lax.addElements '.lax8',
			scrollY:
				translateY: [
					["elInY", "elCenterY", "elOutY"]
					['screenHeight/8', 0, '-screenHeight/8']
				]
	lax.addElements '.lax4',
			scrollY:
				translateY: [
					["elInY", "elCenterY", "elOutY"]
					['screenHeight/4', 0, '-screenHeight/4']
				]
