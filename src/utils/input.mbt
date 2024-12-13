///|
pub fn read_input_of_day(
  day~ : Int? = None,
  loc~ : SourceLoc = _,
  example~ : Bool = false
) -> Array[String] {
  let day = match day {
    Some(day) => if day < 10 { "0\{day}" } else { day.to_string() }
    None => parse_loc(loc)
  }
  let file = if example { "example.txt" } else { "input.txt" }
  let content = @fs.read_file_to_string?(path="./assets/day\{day}/\{file}").unwrap()
  content.trim_space().split("\n").to_array()
}

///|
let re_day : @regexp.RegExp = @regexp.compile?("/src/day(\\d+)/").unwrap()

///|
fn parse_loc(loc : SourceLoc) -> String {
  let res = re_day.matches(loc.to_string())
  let captures = res.captures()
  match captures {
    [_, day] => day
    _ => panic()
  }
}
