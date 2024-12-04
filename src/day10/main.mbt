test "day10" {
  let easy = solve_day10_easy(read_input())
  println(easy)
  let hard = solve_day10_hard(read_input())
  println(hard)
}

typealias Input = Array[String]

typealias Output = Int

fn read_input() -> Input {
  @utils.read_input_of_day(10, example=true)
}
