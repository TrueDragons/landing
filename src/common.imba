export const lax = require('lax.js')

export def timeout(ms)
	return new Promise(do(resolve) setTimeout(resolve, ms))

export def scalePath pathData, scaleFactor
	const path = pathData.match(/([MmLlHhVvCcSsQqTtAaZz])([^MmLlHhVvCcSsQqTtAaZz]*)/g)

	let scaledPath = ""
	if path
		path.forEach do(segment)
			const command = segment.charAt(0)
			const numbers = segment.slice(1).split(/[\s,]+/).map(Number)

			let scaledNumbers = numbers.map do(num, index)
				return (index % 2 === 0 ? Math.round(100 * num * scaleFactor.x) / 100 : Math.round(100 * num * scaleFactor.y) / 100)

			scaledPath += command + scaledNumbers.join(",")

	return scaledPath
