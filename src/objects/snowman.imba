import {Image} from '../objects/image.imba'

const files = 
	snowman:
		path: './assets/avif/roadmap/snowman.avif'
		width: 85
		height: 123
		alt: 'Snowman'
	snowdrift:
		path: './assets/avif/roadmap/snowdrift.avif'
		width: 47
		height: 25
		alt: 'Snowdrift'

export tag Snowman
	css
		@keyframes 
			tumbler
				0%	 transform:rotate(0deg)
				25%	 transform:rotate(-5deg)
				50%	 transform:rotate(0deg)
				75%	 transform:rotate(5deg)
				100% transform:rotate(0deg)
	<self>
		<div>
			css w:100% pos:relative 
			<Image file=files.snowman>
				css pos:absolute w:100% h:auto 
					animation: tumbler 2s linear infinite origin: 50% 100%
			<Image file=files.snowdrift>
				css pos:absolute mt:110% ml:80% h:auto w:80%
