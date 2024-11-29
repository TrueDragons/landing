import {Image} from '../objects/image.imba'

const files =
	body:
		path: './assets/avif/roadmap/straus_body.avif'
		width: 257
		height: 249
		alt: 'Straus body'
	wing: 
		path: './assets/avif/roadmap/straus_wing.avif'
		width: 257
		height: 249
		alt: 'Straus wing'

export tag Straus
	css
		@keyframes 
			straus_body
				0%, 20%, 50%, 100% transform:skewX(0deg) translateX(0%)
				5%, 30%, 80% 	   transform:skewX(35deg) translateX(-32%)
			straus_wing
				0%, 20%, 50%, 100% transform:rotate(0deg)
				5%, 30%, 80% 	   transform:rotate(90deg) # l:-10%
	<self>
		<div>
			css w:100% pos:relative 
			<Image file=files.body>
				css pos:absolute w:100% h:auto 
					animation: straus_body 3s infinite
			<Image file=files.wing>
				css w:100% h:auto
					animation:straus_wing 3s infinite origin: 42% 18%
