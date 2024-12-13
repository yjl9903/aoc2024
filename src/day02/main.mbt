test "day02" {
  let easy = solve_day02_easy(read_input(example=false))
  println(easy)
  let hard = solve_day02_hard(read_input(example=false))
  println(hard)
}

test "day02 - example" {
  let easy = solve_day02_easy(read_input(example=true))
  println(easy)
  let hard = solve_day02_hard(read_input(example=true))
  println(hard)
}

///|
typealias Input = Array[Array[Int]]

///|
typealias Output = Int

///|
fn read_input(example~ : Bool) -> Input {
  @utils.read_input_of_day(example~).map(fn { t => @utils.parse_ints(t) })
}
