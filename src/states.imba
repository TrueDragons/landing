export class States
	states = {}

	def change name, value
		let state = states[name] ||= {value}
		if state.onchange isa Function and state.value != value
			state.value = value
			state.onchange(value)
			

	def listen name, onchange
		let state = states[name] ||= {onchange}
		state.onchange = onchange