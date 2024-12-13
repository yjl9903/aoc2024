test "day08" {
  let easy = solve_day08_easy(read_input(example=false))
  println(easy)
  let hard = solve_day08_hard(read_input(example=false))
  println(hard)
}

test "day08 - example" {
  let easy = solve_day08_easy(read_input(example=true))
  println(easy)
  let hard = solve_day08_hard(read_input(example=true))
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
