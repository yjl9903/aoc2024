test "day06" {
  let easy = solve_day06_easy(read_input(example=false))
  println(easy)
  let hard = solve_day06_hard(read_input(example=false))
  println(hard)
}

test "day06 - example" {
  let easy = solve_day06_easy(read_input(example=true))
  println(easy)
  let hard = solve_day06_hard(read_input(example=true))
  println(hard)
}

///|
typealias Grid = @utils.Grid

///|
typealias Input = Grid

///|
typealias Output = Int

///|
fn read_input(example~ : Bool) -> Input {
  Grid::parse(@utils.read_input_of_day(example~))
}
