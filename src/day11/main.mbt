test "day11" {
  let easy = solve_day11_easy(read_input(example=false))
  println(easy)
  let hard = solve_day11_hard(read_input(example=false))
  println(hard)
}

test "day11 - example" {
  let easy = solve_day11_easy(read_input(example=true))
  println(easy)
  let hard = solve_day11_hard(read_input(example=true))
  println(hard)
}

///|
typealias Input = Array[Int64]

///|
typealias Output = Int64

///|
fn read_input(example~ : Bool) -> Input {
  @utils.parse_int64s(@utils.read_input_of_day(example~)[0])
}
