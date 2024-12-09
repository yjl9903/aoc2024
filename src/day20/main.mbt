test "day20" {
  let easy = solve_day20_easy(read_input())
  println(easy)
  let hard = solve_day20_hard(read_input())
  println(hard)
}

///|
typealias Input = Array[String]

///|
typealias Output = Int

///|
fn read_input() -> Input {
  @utils.read_input_of_day(20, example=true)
}
