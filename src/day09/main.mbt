test "day09" {
  let easy = solve_day09_easy(read_input(example=false))
  println(easy)
  let hard = solve_day09_hard(read_input(example=false))
  println(hard)
}

test "day09 - example" {
  let easy = solve_day09_easy(read_input(example=true))
  println(easy)
  let hard = solve_day09_hard(read_input(example=true))
  println(hard)
}

///|
typealias Input = Array[Int]

///|
typealias Output = Int64

///|
fn read_input(example~ : Bool) -> Input {
  @utils.read_input_of_day(example~)[0]
  .to_array()
  .map(fn { c => c.to_int() - '0'.to_int() })
}
