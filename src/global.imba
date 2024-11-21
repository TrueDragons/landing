global css
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
		min-width:230px px:2rem
		of:hidden
		# scroll-snap-align: start
		# scroll-snap-stop: always
		
	.header
		ff:"Sigmar One" fw:normal tt:uppercase fs:2.4rem lh:2.6rem # fs:4vh lh:5dex
		c:white ta:center
		ts: -2px 2px 0px #0f0f0f text-stroke: 1px #0f0f0f -webkit-text-stroke: 1px #0f0f0f
		# mt: 30px
		mt: 3vh
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
		# max-width:600px
		ml: auto mr: auto
		# mr: 50px ml:50px
		# ml:10vw mr:10vw
		# py:3vh
	.video
		o:0.99 object-fit:cover w:100% h:100% mt:5% # mt:30px # max-width:600px 
