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
			<span [ml:20px]> "version 0.0.3"
			<img src=icons.telegram>
				css ml:auto mr:15px o@hover:0.5 cursor:pointer ead:0.5s
			<img src=icons.twitter>
				css o@hover:0.5 cursor:pointer ead:0.5s
		<div.header>
			<span> "Feels like Falling "
			<span [c:#97d666]> "Behind?"
		<div>
			<video.video playsInline loop autoplay muted>
				<source src='assets/block01.mp4' type="video/mp4">
		