export class Events
	list = {}
	
	def listen name, handler
		if !list[name]
			list[name] = []
		list[name].push handler
	
	def emit name
		const handlers = list[name]
		if list[name]
			for handler in handlers
				handler! if handler isa Function