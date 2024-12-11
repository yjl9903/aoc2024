///|
pub fn solve_day11_hard(input : Input) -> Output {
  let cache = Map::new()
  fn calc(x : Int64, dep : Int) -> Int64 {
    if dep == 0 {
      return 1
    }
    match cache.get((x, dep)) {
      Some(v) => v
      None => {
        let r = apply(x)
        let mut ans = 0L
        for x in r {
          ans += calc(x, dep - 1)
        }
        cache.set((x, dep), ans)
        ans
      }
    }
  }

  let turn = 75
  let mut ans = 0L
  for x in input {
    ans += calc(x, turn)
  }
  ans
}
