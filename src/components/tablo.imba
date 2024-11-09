# @ts-ignore
import tablo from '../images/tablo.webp'

export tag Tablo
	mstate = 'moff'
	dstate = 'doff'
	flip = false
	main = ''
	dates = ''
	
	css 
		.mon
			pl:3vw
			bgc:#849FE4
			animation: tablo 3s
		.moff
			pl:40vw
		.don
			c:white
			bgc:#FF7859
			animation: blink 3s
		.doff
			c:transparent 
			bgc:#CA3E2F
		@keyframes
			tablo
				0% pl:40vw bgc:#47557A
				29% bgc:#47557A
				30% bgc:#849FE4
				100% pl:3vw bgc:#849FE4
			blink
				0% c:transparent bgc:#CA3E2F
				90% c:transparent bgc:#CA3E2F
				92% c:white bgc:#FF7859
				96% c:transparent bgc:#CA3E2F
				100% c:white bgc:#FF7859

	def on
		mstate = 'mon'
		dstate = 'don'

	def off
		mstate = 'moff'
		dstate = 'doff'

	<self>
		css of:hidden
		<div.{mstate} @intersect.in=on @intersect.out=off> main
			css pos:absolute mt:1vw ml:1vw pt:1.2vw pb:0.8vw w:250% ff:"Jersey 20" fw:400 fs:normal fs:3.5vw c:white ws:preserve
		<div.{dstate}> dates
			css pos:absolute w:23vw h:3vw mt:6.4vw ml:1vw pt:0.2vw ff:"Roboto" fw:700 fs:normal fs:1.6vw c:white ta:center
			
		<img src=tablo [scale-x:-1]=flip>
			css w:25vw pos:absolute