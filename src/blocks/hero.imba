const icons = {
	logo: 'assets/logo.svg'
	telegram: 'assets/telegram.svg'
	twitter: 'assets/twitter.svg'
}

export tag Hero
	<self.block [mt:0]>
		<div>
			css d:hflex h:32px ai:center mt:15px px:2rem
			<img src=icons.logo>
				css w:100px
			<span [ml:20px]> "version 0.0.9"
			<img src=icons.telegram>
				css ml:auto mr:15px o@hover:0.5 cursor:pointer ead:0.5s
			<img src=icons.twitter>
				css o@hover:0.5 cursor:pointer ead:0.5s
		<div.header [mt:5vh]>
			<span> "Feeling "
			<span.green> "lost"
			<span> "?"
			<br>
			<span> "Get "
			<span.green> "$True"
			<span> "!"
		<div>
			<video.video playsInline loop autoplay muted>
				css aspect-ratio:0.8133
				<source src='assets/video/overview.mp4' type="video/mp4">
		