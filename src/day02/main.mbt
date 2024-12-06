test "day02" {
  let easy = solve_day02_easy(read_input())
  println(easy)
  let hard = solve_day02_hard(read_input())
  println(hard)
}

///|
typealias Input = Array[Array[Int]]

///|
typealias Output = Int

///|
fn read_input() -> Input {
  @utils.read_input_of_day(2).map(fn { t => @utils.parse_ints(t) })
}
