test "day20" {
  let easy = solve_day20_easy(read_input(example=false))
  println(easy)
  let hard = solve_day20_hard(read_input(example=false))
  println(hard)
}

test "day20 - example" {
  let easy = solve_day20_easy(read_input(example=true))
  println(easy)
  let hard = solve_day20_hard(read_input(example=true))
  println(hard)
}

///|
typealias Input = Array[String]

///|
typealias Output = Int

///|
fn read_input(example~ : Bool) -> Input {
  @utils.read_input_of_day(example~)
}
