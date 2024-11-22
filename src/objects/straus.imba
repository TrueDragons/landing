import {images} from '../assets.imba'

export tag Straus
	css
		@keyframes 
			straus_body
				0%, 20%, 50%, 100% transform:skewX(0deg) translateX(0%)
				5%, 30%, 80% 	   transform:skewX(35deg) translateX(-7vw)
			straus_wing
				0%, 20%, 50%, 100% transform:rotate(0deg)
				5%, 30%, 80% 	   transform:rotate(90deg) # l:-10%
	<self>
		css w:100% pos:relative
		<img src=images.straus_body.url loading="lazy" decoding="asynchronous" width="{images.straus_body.width}" height="{images.straus_body.height}">
			css w:100% h:auto 
				animation: straus_body 3s infinite
		<img src=images.straus_wing.url loading="lazy" decoding="asynchronous" width="{images.straus_wing.width}" height="{images.straus_wing.height}">
			css pos:absolute w:100% h:auto l:-6% t:0
				animation:straus_wing 3s infinite origin: 47% 20%
