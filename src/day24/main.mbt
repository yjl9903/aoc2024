test "day24" {
  let easy = solve_day24_easy(read_input(example=false))
  println(easy)
  let hard = solve_day24_hard(read_input(example=false))
  println(hard)
}

test "day24 - example" {
  let easy = solve_day24_easy(read_input(example=true))
  println(easy)
  let hard = solve_day24_hard(read_input(example=true))
  println(hard)
}

///|
enum Gate {
  AND
  OR
  XOR
} derive(Show, Eq, Hash)

///|
typealias Input = (Array[(String, Int)], Array[(String, Gate, String, String)])

///|
typealias Output = Int64

///|
fn read_input(example~ : Bool) -> Input {
  let input = @utils.read_input_of_day(example~)
  let mut i = 0
  let regs = []
  let cons = []
  while i < input.length() && input[i] != "" {
    let line = input[i]
    let line = line.split(": ").to_array()
    regs.push((line[0], @utils.parse_int(line[1])))
    i += 1
  }
  i += 1
  while i < input.length() {
    let line = input[i]
    let line = line.split(" ").to_array()
    let op = match line[1] {
      "AND" => AND
      "OR" => OR
      "XOR" => XOR
      _ => panic()
    }
    cons.push((line[0], op, line[2], line[4]))
    i += 1
  }
  (regs, cons)
}
