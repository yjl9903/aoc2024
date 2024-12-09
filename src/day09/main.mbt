test "day09" {
  let easy = solve_day09_easy(read_input())
  println(easy)
  let hard = solve_day09_hard(read_input())
  println(hard)
}

///|
typealias Input = Array[Int]

///|
typealias Output = Int64

///|
fn read_input() -> Input {
  @utils.read_input_of_day(9, example=false)[0]
  .to_array()
  .map(fn { c => c.to_int() - '0'.to_int() })
}
