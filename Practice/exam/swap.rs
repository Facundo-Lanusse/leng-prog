fn main() {
    let mut x = 4000;
    let mut y = 200;
    swap(&mut x, &mut y);
    println!("x= {x}, y= {y}")
}

fn swap(a: &mut i32, b: &mut i32) {
  let temp = *a; // desreferencio a para obtener el valor
  *a = *b;
  *b = temp;
}