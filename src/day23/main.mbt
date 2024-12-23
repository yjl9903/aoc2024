test "day23" {
  let easy = solve_day23_easy(read_input(example=false))
  println(easy)
  let hard = solve_day23_hard(read_input(example=false))
  println(hard)
}

test "day23 - example" {
  let easy = solve_day23_easy(read_input(example=true))
  println(easy)
  let hard = solve_day23_hard(read_input(example=true))
  println(hard)
}

///|
typealias Input = Array[(String, String)]

///|
typealias Output = Int

///|
fn read_input(example~ : Bool) -> Input {
  @utils.read_input_of_day(example~).map(fn {
    line => {
      let line = line.split("-").to_array()
      (line[0], line[1])
    }
  })
}
