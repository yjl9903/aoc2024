test "day14" {
  // let easy = solve_day14_easy(read_input(example=false))
  // println(easy)
  let hard = solve_day14_hard(read_input(example=false))
  println(hard)
}

test "day14 - example" {
  let easy = solve_day14_easy(read_input(example=true))
  println(easy)
  let hard = solve_day14_hard(read_input(example=true))
  println(hard)
}

///|
struct Robot {
  pos : (Int, Int)
  velocity : (Int, Int)
}

///|
typealias Input = Array[Robot]

///|
typealias Output = Int64

///|
fn read_input(example~ : Bool) -> Input {
  let re = @regexp.compile?("p=(\\d+),(\\d+) v=(-?\\d+),(-?\\d+)").unwrap()
  let input = @utils.read_input_of_day(example~)
  input.map(
    fn {
      line => {
        let res = re.matches(line)
        let res = res.captures()
        {
          pos: (@utils.parse_int(res[2]), @utils.parse_int(res[1])),
          velocity: (@utils.parse_int(res[4]), @utils.parse_int(res[3])),
        }
      }
    },
  )
}
