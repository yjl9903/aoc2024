test "day22" {
  let easy = solve_day22_easy(read_input(example=false))
  println(easy)
  let hard = solve_day22_hard(read_input(example=false))
  println(hard)
}

test "day22 - example" {
  let easy = solve_day22_easy(read_input(example=true))
  println(easy)
  let hard = solve_day22_hard(read_input(example=true))
  println(hard)
}

///|
typealias Input = Array[Int64]

///|
typealias Output = Int64

///|
fn read_input(example~ : Bool) -> Input {
  @utils.read_input_of_day(example~).map(fn { t => @utils.parse_int64(t) })
}
