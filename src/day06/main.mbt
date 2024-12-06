test "day06" {
  let easy = solve_day06_easy(read_input())
  println(easy)
  let hard = solve_day06_hard(read_input())
  println(hard)
}

///|
typealias Input = Array[Array[Char]]

///|
typealias Output = Int

///|
fn read_input() -> Input {
  @utils.read_input_of_day(6, example=false).map(fn { a => a.to_array() })
}
