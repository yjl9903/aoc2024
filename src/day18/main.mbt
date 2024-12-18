test "day18" {
  let easy = solve_day18_easy(71, 1024, read_input(example=false))
  println(easy)
  let hard = solve_day18_hard(71, read_input(example=false))
  println(hard)
}

test "day18 - example" {
  let easy = solve_day18_easy(7, 12, read_input(example=true))
  println(easy)
  let hard = solve_day18_hard(7, read_input(example=true))
  println(hard)
}

///|
typealias Input = Array[(Int, Int)]

///|
typealias Output = Int

///|
fn read_input(example~ : Bool) -> Input {
  @utils.read_input_of_day(example~).map(fn {
    l => {
      let l = @utils.parse_ints(l, split=",")
      (l[0], l[1])
    }
  })
}
