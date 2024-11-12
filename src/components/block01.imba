const icons = {
	logo: 'assets/logo.svg'
	telegram: 'assets/telegram.svg'
	twitter: 'assets/twitter.svg'
}

export tag Block01
	<self.block>
		<div>
			css d:hflex h:32px ai:center mt:15px
			<img src=icons.logo>
				css w:100px
			<span [ml:20px]> "version 0.0.1"
			<img src=icons.telegram>
				css ml:auto mr:15px o@hover:0.5 cursor:pointer ead:0.5s
			<img src=icons.twitter>
				css o@hover:0.5 cursor:pointer ead:0.5s
		<div.header>
			<span> "Feels like Falling "
			<span [c:#97d666]> "Behind?"
		# <video controlslist="nofullscreen" playsinline="" preload="" muted="" loop="" poster="../assets/poster-1.jpg" class="loop" src=video>
		<div>
			css m:auto ta:center max-width:500px max-height:60vh # mt:20px 
			<video playsInline loop autoplay>
				css o:0.99 object-fit:cover w:100% h:100% # max-width:300px# h:65vh # w:90vw max-width:500px # aspect-ratio:0.8132 
				<source src='assets/block01.mp4' type="video/mp4">
		