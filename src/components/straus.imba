# @ts-ignore
import straus_body from '../images/straus_body.webp'
# @ts-ignore
import straus_wing from '../images/straus_wing.webp'

export tag Straus
	css
		&
			w: 100%
		.straus
			# w:100%
			# w: 200px 
			animation-iteration-count: infinite 
			animation-name: straus 
			animation-duration: 3s 
			# animation-direction: alternate
		@keyframes 
			straus
				0% transform:skewX(0deg) translateX(0%)
				5% transform:skewX(35deg) translateX(-4vw)
				20% transform:skewX(0deg) translateX(0%)
				30% transform:skewX(35deg) translateX(-4vw)
				50% transform:skewX(0deg) translateX(0%)
				80% transform:skewX(35deg) translateX(-4vw)
				100% transform:skewX(0deg) translateX(0%)
			straus_wing
				0% transform:rotate(0deg)
				5% transform:rotate(90deg)
				20% transform:rotate(0deg)
				30% transform:rotate(90deg)
				50% transform:rotate(0deg)
				80% transform:rotate(90deg)
				100% transform:rotate(0deg)
		.straus_wing
			pos:absolute 
			left:7.5vw t:5vw
			animation-iteration-count: infinite 
			animation-name: straus_wing
			animation-duration: 3s
			transform-origin: 90% 20%

	<self>
		<.straus>
			<img src=straus_body>
				css w:100%
			<img.straus_wing src=straus_wing>
				css w:20%