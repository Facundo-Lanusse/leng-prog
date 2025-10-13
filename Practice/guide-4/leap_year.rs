fn is_leap_year(year: i32) {
  if year % 400 == 0 || (year % 100 != 0 && year % 4 != 0 ){
    println!("It's a leap year");
  } else {
    println!("It's not a leap year");
  }
}

fn main () {
  is_leap_year(1900);
}