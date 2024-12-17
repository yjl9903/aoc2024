test "day17" {
  let easy = solve_day17_easy(read_input(example=false))
  println(easy)
  let hard = solve_day17_hard(read_input(example=false))
  println(hard)
}

test "day17 - example" {
  let easy = solve_day17_easy(read_input(example=true))
  println(easy)
  let hard = solve_day17_hard(read_input(example=true))
  println(hard)
}

///|
struct Program {
  a : Int64
  b : Int64
  c : Int64
  code : Array[Int64]
}

///|
typealias Input = Program

///|
typealias Output = String

///|
fn read_input(example~ : Bool) -> Input {
  let line = @utils.read_input_of_day(example~)
  let a = line[0].substring(start="Register A: ".length())
  let b = line[1].substring(start="Register B: ".length())
  let c = line[2].substring(start="Register C: ".length())
  {
    a: @utils.parse_int64(a),
    b: @utils.parse_int64(b),
    c: @utils.parse_int64(c),
    code: @utils.parse_int64s(
      line[4].substring(start="Program: ".length()),
      split=",",
    ),
  }
}
