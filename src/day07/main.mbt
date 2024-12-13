test "day07" {
  let easy = solve_day07_easy(read_input(example=false))
  println(easy)
  let hard = solve_day07_hard(read_input(example=false))
  println(hard)
}

test "day07 - example" {
  let easy = solve_day07_easy(read_input(example=true))
  println(easy)
  let hard = solve_day07_hard(read_input(example=true))
  println(hard)
}

///|
typealias Input = Array[(Int64, Array[Int64])]

///|
typealias Output = Int64

///|
fn read_input(example~ : Bool) -> Input {
  @utils.read_input_of_day(example~).map(
    fn {
      line =>
        match line.split(": ").to_array() {
          [lhs, rhs] => (@utils.parse_int64(lhs), @utils.parse_int64s(rhs))
          _ => panic()
        }
    },
  )
}
