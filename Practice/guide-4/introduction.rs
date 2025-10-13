use std::collections::HashMap;
use std::iter::FromIterator;

fn mutability() {
  let mut sum = 0;
  for i in 0..5 {
    sum += i;
  }
  println!("Sum is: {}", sum);
}

fn casting() {
  let mut sum2 = 0.0;
  for i in 0..5 {
    sum2 += i as f64;
  }
  println!("Sum is: {}", sum2);
}

fn cube(x: f64) -> f64 {
  x * x * x
}

fn hypotenuse(a: f64, b: f64) -> f64 {
  (a * a + b * b).sqrt()
}

fn abs(x: f64) -> f64 {
  if x < 0.0 { 
    -x 
  } else {
    x
  }
}

fn abs_return(x: f64) -> f64 {
  let mut temp = x;
  if x < 0.0 { 
    temp = -x; 
  }
  return temp;
}

fn solve_quadratic(a: f64, b: f64, c: f64) -> Option<(f64, f64)> {
  let d = b * b - 4.0 * a * c;
  let two_a = 2.0 * a;
  if d < 0.0 {
    None
  } else {
    let d = d.sqrt();
    Some(((-b + d) / two_a,(-b - d) / two_a))
  }
}

enum TrafficLight { Red, Yellow, Green}  

fn main() {
  mutability();
  casting();
  println!("{}", cube(3.0));
  println!("{}", hypotenuse(3.0, 4.0));
  println!("{}", abs(3.0));
  println!("{}", abs_return(-63.0));
  let tup: (i32, f64, bool) = (100, 6.4, true);
  let (a, b, c) = tup;
  println!("firs: {}, second: {}, third: {}", a, b, c);
  match solve_quadratic(1.0, -3.0, 2.0) {
    None => println!("No real roots"),
    Some((r1, r2)) => println!("Roots are: {} and {}", r1, r2),
  };
  let bad = solve_quadratic(1.0, 0.0, 2.0).unwrap_or((-1.0, -1.0));
  println!("Bad roots are: {} and {}", bad.0, bad.1);
  let light: TrafficLight = TrafficLight::Red;
  match light {
    TrafficLight::Red => println!("Stop!"),
    TrafficLight::Yellow => println!("Slow down!"),
    TrafficLight::Green => println!("Go!"),
  }
  let mut stock: HashMap<_,_> = HashMap::from_iter([
    ("Apples", 10),
    ("Oranges", 3)
  ]);
  let a = stock.entry("Apples").or_insert(0);
  *a += 200;

  let p = stock.entry("Pears").or_default();
  *p += 20;

  println!("{stock:?}")
}

