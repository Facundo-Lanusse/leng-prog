// fn main() {
// 	let s = String::from("hello, world");
// 	print_str(&s);
// 	println!("{}", s);
// }

// fn print_str(s: String) {
// 	println!("{}",s)
// }

// fn main() {
// 	let mut s = String::from("hello");
// 	let r1 = &mut s;
// 	let r2 = &r1;
// 	println!("{} {}", r1, r2);
// }

fn main() {
	let x = Box::new(5);
	let mut y = Box::new(*x);
	*y = 4;
	assert_eq!(*x, 5);
	println!("Success");
}