#[derive(Clone, Copy)]
enum MachineState {
	Normal,
	Upper,
	Lower,
	Comment
}

machine_cycle()

fn machine_cycle(state: MachineState, character: char) -> (Option<char>, MachineState) {
	use std::ascii::AsciiExt;
	use MachineState::*;

	match (state, character) {
		(Normal, '#') => (None, Comment),
		(Normal, '^') => (None, Upper),
		(Normal, '_') => (None, Lower),

		(Comment, '#') => (None, Normal),
		(Upper, '^') => (None, Normal),
		(Lower, '_') => (None, Normal),

		(Normal, _) => (Some(character), Normal),
		(Upper, _) => (Some(character.to_ascii_uppercase()), Upper),
		(Lower, _) => (Some(character.to_ascii_lowercase()), Lower),
		(Comment, _) => (None, Comment)
	}
}

fn run_machine(input: &str) -> String {
	let mut state = MachineState::Normal;
	let mut processed_string = String::new();

	for character in input.chars() {
		let (output, new_state) = machine_cycle(state, character);
		if let Some(c) = output {
			processed_string.push(c);
		}
		state = new_state;
	}
	processed_string
}

fn main() {
	let input_string = "This text is _LOWERCaSe_, this is ^capiTaL^. #this is a comment# ";
	let ouput_string = run_machine(input_string);
	println!("Input:\t{}\nOuput:\t{}", input_string, ouput_string);
}