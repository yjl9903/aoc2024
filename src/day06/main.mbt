test "day06" {
  let easy = solve_day06_easy(read_input())
  println(easy)
  let hard = solve_day06_hard(read_input())
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
