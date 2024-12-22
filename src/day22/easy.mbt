///|
pub fn solve_day22_easy(input : Input) -> Output {
  let mut ans = 0L
  for sec in input {
    let mut sec = sec
    for i in 0..<2000 {
      sec = generate(sec)
    }
    ans += sec
  }
  ans
}

///|
fn generate(sec : Int64) -> Int64 {
  let sec = ((sec * 64) ^ sec) % 16777216
  let sec = ((sec / 32) ^ sec) % 16777216
  let sec = ((sec * 2048) ^ sec) % 16777216
  sec
}
