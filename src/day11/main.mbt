test "day11" {
  let easy = solve_day11_easy(read_input())
  println(easy)
  let hard = solve_day11_hard(read_input())
  println(hard)
}

///|
typealias Input = Array[String]

///|
typealias Output = Int

///|
fn read_input() -> Input {
  @utils.read_input_of_day(11, example=true)
}
