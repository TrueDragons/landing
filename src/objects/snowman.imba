import {images} from '../assets.imba'

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
			<img src=images.snowman.url loading="lazy" decoding="asynchronous" width="{images.snowman.width}" height="{images.snowman.height}">
				css pos:absolute w:100% h:auto 
					animation: tumbler 2s linear infinite origin: 50% 100%
			<img src=images.snowdrift.url loading="lazy" decoding="asynchronous" width="{images.snowdrift.width}" height="{images.snowdrift.height}">
				css pos:absolute mt:110% ml:80% h:auto w:80%
