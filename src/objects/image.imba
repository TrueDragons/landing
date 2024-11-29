export tag Image < img
	file
	<self src=file.path loading="lazy" decoding="asynchronous" width="{file.width}" height="{file.height}" alt=file.alt>
