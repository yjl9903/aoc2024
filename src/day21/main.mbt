test "day21" {
  let easy = solve_day21_easy(read_input(example=false))
  println(easy)
  let hard = solve_day21_hard(read_input(example=false))
  println(hard)
}

test "day21 - example" {
  let easy = solve_day21_easy(read_input(example=true))
  println(easy)
  let hard = solve_day21_hard(read_input(example=true))
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
