test "day19" {
  let easy = solve_day19_easy(read_input(example=false))
  println(easy)
  let hard = solve_day19_hard(read_input(example=false))
  println(hard)
}

test "day19 - example" {
  let easy = solve_day19_easy(read_input(example=true))
  println(easy)
  let hard = solve_day19_hard(read_input(example=true))
  println(hard)
}

///|
typealias Input = (Array[String], Array[String])

///|
typealias Output = Int

///|
fn read_input(example~ : Bool) -> Input {
  let lines = @utils.read_input_of_day(example~)
  let patterns = lines[0].split(", ").to_array()
  let targets = lines.iter().drop(2).to_array()
  (patterns, targets)
}
