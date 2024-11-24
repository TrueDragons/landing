export tag Video < video
	file

	<self playsInline loop autoplay muted [aspect-ratio: {file.width / file.height}]>
		css o:0.99 object-fit:cover w:100% h:100% mt:5%
		<source src=file.url type=file.type>