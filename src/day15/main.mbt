test "day15" {
  let easy = solve_day15_easy(read_input(example=false))
  println(easy)
  let hard = solve_day15_hard(read_input(example=false))
  println(hard)
}

test "day15 - example" {
  let easy = solve_day15_easy(read_input(example=true))
  println(easy)
  let hard = solve_day15_hard(read_input(example=true))
  println(hard)
}

///|
typealias Grid = @utils.Grid

///|
typealias Input = (Grid, Array[Char])

///|
typealias Output = Int

///|
fn read_input(example~ : Bool) -> Input {
  let input = @utils.read_input_of_day(example~)
  let idx = input.search_by(fn { l => l.length() == 0 }).unwrap()
  let (grid, cmd) = input.split_at(idx)
  let grid = Grid::parse(grid)
  let cmd = String::concat(cmd, separator="").to_array()
  (grid, cmd)
}
