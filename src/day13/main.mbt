test "day13" {
  let easy = solve_day13_easy(read_input())
  println(easy)
  let hard = solve_day13_hard(read_input())
  println(hard)
}

///|
typealias Input = Array[Machine]

///|
typealias Output = Int64

///|
struct Machine {
  a : (Int64, Int64)
  b : (Int64, Int64)
  price : (Int64, Int64)
} derive(Show)

///|
fn read_input() -> Input {
  let input = @utils.read_input_of_day(example=false)
  let button_re = @regexp.compile?("Button [AB]: X\\+(\\d+), Y\\+(\\d+)").unwrap()
  let price_re = @regexp.compile?("Prize: X=(\\d+), Y=(\\d+)").unwrap()
  let result = []
  let mut i = 0
  while i + 2 < input.length() {
    let a = input[i]
    let b = input[i + 1]
    let p = input[i + 2]
    let a = button_re.matches(a).captures()
    let b = button_re.matches(b).captures()
    let p = price_re.matches(p).captures()
    result.push(
      {
        a: (@utils.parse_int64(a[1]), @utils.parse_int64(a[2])),
        b: (@utils.parse_int64(b[1]), @utils.parse_int64(b[2])),
        price: (@utils.parse_int64(p[1]), @utils.parse_int64(p[2])),
      },
    )
    i += 4
  }
  result
}
