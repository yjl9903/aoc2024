test "day01" {
  let easy = solve_day01_easy(read_input(example=false))
  println(easy)
  let hard = solve_day01_hard(read_input(example=false))
  println(hard)
}

test "day01 - example" {
  let easy = solve_day01_easy(read_input(example=true))
  println(easy)
  let hard = solve_day01_hard(read_input(example=true))
  println(hard)
}

///|
typealias Input = Array[(Int, Int)]

///|
typealias Output = Int

///|
fn read_input(example~ : Bool) -> Array[(Int, Int)] {
  @utils.read_input_of_day(example~).map(
    fn {
      t => {
        let t = @utils.parse_ints(t)
        (t[0], t[1])
      }
    },
  )
}
