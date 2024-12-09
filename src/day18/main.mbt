test "day18" {
  let easy = solve_day18_easy(read_input())
  println(easy)
  let hard = solve_day18_hard(read_input())
  println(hard)
}

///|
typealias Input = Array[String]

///|
typealias Output = Int

///|
fn read_input() -> Input {
  @utils.read_input_of_day(18, example=true)
}
