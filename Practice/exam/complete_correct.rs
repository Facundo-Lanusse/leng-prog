use std::collections::HashMap;

fn main() {
	let mut scores = HashMap::new();
	scores.insert("Sunface", 98);
	scores.insert("Daniel", 95);
	scores.insert("Ashley", 69);
	scores.insert("Katie", 58);
	
	if let Some(score) = scores.get("Sunface") {
		println!("{score}");
	}
	
	match scores.get("Sunface") {
		Some(score) => println!("{score}"),
		None => println!("Not found")
	}
	
	if scores.contains_key("Daniel") {
		let score = scores["Daniel"];
		assert_eq!(score, 95);
		scores.remove("Daniel");
	}
	
	assert_eq!(scores.len(), 3);
	
	for (name, score) in scores {
		println!("The score of {} is {}", name, score);
	}

}