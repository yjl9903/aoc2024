///|
pub fn solve_day11_easy(input : Input) -> Output {
  let turn = 25
  let mut ans = 0L
  for x in input {
    let mut arr = [x]
    for i in 0..<turn {
      let new_arr = []
      for x in arr {
        let r = apply(x)
        r.each(fn { x => new_arr.push(x) })
      }
      arr = new_arr
    }
    ans += arr.length().to_int64()
  }
  ans
}

///|
fn apply(x : Int64) -> Array[Int64] {
  if x == 0 {
    [1]
  } else {
    let str = x.to_string()
    if str.length() % 2 == 0 {
      let lhs = str.substring(start=0, end=str.length() / 2)
      let rhs = str.substring(start=str.length() / 2, end=str.length())
      [@utils.parse_int64(lhs), @utils.parse_int64(rhs)]
    } else {
      [x * 2024]
    }
  }
}
