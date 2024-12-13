test "day12" {
  let easy = solve_day12_easy(read_input())
  println(easy)
  let hard = solve_day12_hard(read_input())
  println(hard)
}

///|
typealias Grid = @utils.Grid

///|
typealias Input = Grid

///|
typealias Output = Int

///|
fn read_input() -> Input {
  Grid::parse(@utils.read_input_of_day(example=false))
}
