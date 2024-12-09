test "day16" {
  let easy = solve_day16_easy(read_input())
  println(easy)
  let hard = solve_day16_hard(read_input())
  println(hard)
}

///|
typealias Input = Array[String]

///|
typealias Output = Int

///|
fn read_input() -> Input {
  @utils.read_input_of_day(16, example=true)
}
