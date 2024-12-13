test "day05" {
  let easy = solve_day05_easy(read_input(example=false))
  println(easy)
  let hard = solve_day05_hard(read_input(example=false))
  println(hard)
}

test "day05 - example" {
  let easy = solve_day05_easy(read_input(example=true))
  println(easy)
  let hard = solve_day05_hard(read_input(example=true))
  println(hard)
}

///|
typealias Input = (Array[(Int, Int)], Array[Array[Int]])

///|
typealias Output = Int

///|
fn read_input(example~ : Bool) -> Input {
  let lines = @utils.read_input_of_day(example~)
  let edges = []
  let updates = []
  let mut i = 0
  while i < lines.length() && lines[i] != "" {
    let line = lines[i]
    match line.split("|").to_array() {
      [from, to] => edges.push((@utils.parse_int(from), @utils.parse_int(to)))
      _ => ()
    }
    i += 1
  }
  i += 1
  while i < lines.length() && lines[i] != "" {
    let a = @utils.parse_ints(lines[i], split=",")
    updates.push(a)
    i += 1
  }
  (edges, updates)
}
