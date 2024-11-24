global css
	# @font-face
	# 	ff: "Arcade"
	# 	src: url('./assets/fonts/arcade.ttf') format("truetype")
	# 	fs: normal fw: normal
	# @font-face
	# 	ff: "Montserrat"
	# 	src: url('./assets/fonts/montserrat.woff2') format("woff2")
	# 	fs: normal fw: normal
	# @font-face
	# 	ff: "Sigmar One"
	# 	src: url('./assets/fonts/sigmarone.woff2') format("woff2")
	# 	fs: normal fw: normal

	html
		# height: -webkit-fill-available
		# scroll-margin-bottom: 20vh
		# scroll-snap-type: y mandatory
		# scroll-snap-type: y proximity
		overflow-x:hidden
		overscroll-behavior: none
		scroll-behavior: smooth
		# 	of: hidden #  w:100%
		max-width: 600px
		m:auto
		# @lt-xl fs:1rem
		# @lt-md fs:0.85rem
		# @lt-sm fs:0.7rem
		# @lt-xs fs:0.55rem
	body
		# h: 100vh
		m: 0
		p: 0
		bgc: #CFEAF8 # #d2edf8
		ta:center

		# overflow-y: scroll
		# scroll-snap-type: y proximity
		# scroll-behavior: smooth
		# position: fixed
		# -webkit-overflow-scrolling: touch
		# min-height: 100vh;
		# min-height: -webkit-fill-available
	# @root
	# 	app-height: 100%
	# 	1dex: 1vw + 1vh
	.block
		d:vflex 
		# h:100% max-height:100% min-height:100%
		# h:100vh max-height:100vh min-height:100vh
		# h:100%
		# h:-webkit-fill-available
		# h:var(--app-height) max-height:var(--app-height) min-height:var(--app-height)
		min-width:230px
		of:hidden
		mt: 10vh
		# scroll-snap-align: start
		# scroll-snap-stop: always
		
	.header
		ff:"Sigmar One" fw:normal tt:uppercase fs:2.4rem lh:2rem # fs:4vh lh:5dex
		c:white ta:center
		ts: -2px 2px 0px #0f0f0f text-stroke: 1px #0f0f0f -webkit-text-stroke: 1px #0f0f0f
		# mt: 30px
		px:1rem
		# ml:8rem mr:8rem
		# fs@lt-md:2.2rem
		# fs@lt-sm:1.8rem
		# fs@lt-xs:1.2rem
		# ml: auto mr: auto
		
		# mt:auto mb:auto
	.green
		c:#97d666
	.gray
		c:gray3 fs:1.5rem ts:none
	.text
		ff:"Montserrat" fw:normal fs:16px ta:left
		c:#343434
		# mt: 30px
		mt:5%
		px:1rem
		# max-width:600px
		ml: auto mr: auto
		# ml:6rem mr:6rem
		# mr: 50px ml:50px
		# ml:10vw mr:10vw
		# py:3vh
