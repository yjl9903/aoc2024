test "day04" {
  let easy = solve_day04_easy(read_input(example=false))
  println(easy)
  let hard = solve_day04_hard(read_input(example=false))
  println(hard)
}

test "day04 - example" {
  let easy = solve_day04_easy(read_input(example=true))
  println(easy)
  let hard = solve_day04_hard(read_input(example=true))
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
