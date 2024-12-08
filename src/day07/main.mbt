test "day07" {
  let easy = solve_day07_easy(read_input())
  println(easy)
  let hard = solve_day07_hard(read_input())
  println(hard)
}

///|
typealias Input = Array[(Int64, Array[Int64])]

///|
typealias Output = Int64

///|
fn read_input() -> Input {
  @utils.read_input_of_day(7, example=false).map(
    fn {
      line =>
        match line.split(": ").to_array() {
          [lhs, rhs] => (@utils.parse_int64(lhs), @utils.parse_int64s(rhs))
          _ => panic()
        }
    },
  )
}
