test "day24" {
  let easy = solve_day24_easy(read_input())
  println(easy)
  let hard = solve_day24_hard(read_input())
  println(hard)
}

///|
typealias Input = Array[String]

///|
typealias Output = Int

///|
fn read_input() -> Input {
  @utils.read_input_of_day(24, example=true)
}
