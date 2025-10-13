fn test(a: i32) {
    if a == 0 { return }
    let b = a - 1;
    let c = &b;
    let d = Box::new(*c + 10);

    test(b);
    println!("{a} {b} {c} {d}")
}

fn main () {
  test(2);
}