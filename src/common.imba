export def timeout(ms)
	return new Promise(do(resolve) setTimeout(resolve, ms))