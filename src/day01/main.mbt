test "day01" {
  let easy = solve_day01_easy(read_input())
  println(easy)
  let hard = solve_day01_hard(read_input())
  println(hard)
}

typealias Input = Array[(Int, Int)]

typealias Output = Int

fn read_input() -> Array[(Int, Int)] {
  @utils.read_input_of_day(1).map(
    fn {
      t => {
        let t = @utils.parse_ints(t)
        (t[0], t[1])
      }
    },
  )
}
