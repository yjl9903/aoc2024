test "day14" {
  let easy = solve_day14_easy(read_input())
  println(easy)
  let hard = solve_day14_hard(read_input())
  println(hard)
}

///|
typealias Input = Array[String]

///|
typealias Output = Int

///|
fn read_input() -> Input {
  @utils.read_input_of_day(14, example=true)
}
