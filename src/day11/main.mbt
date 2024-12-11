test "day11" {
  let easy = solve_day11_easy(read_input())
  println(easy)
  let hard = solve_day11_hard(read_input())
  println(hard)
}

///|
typealias Input = Array[Int64]

///|
typealias Output = Int64

///|
fn read_input() -> Input {
  @utils.parse_int64s(@utils.read_input_of_day(11, example=false)[0])
}
