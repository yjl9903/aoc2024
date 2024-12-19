///|
pub fn solve_day19_hard(input : Input) -> Int64 {
  let patterns = input.0
  let targets = input.1
  let mut ans = 0L
  targets.each(fn {
    t => {
      let f = Array::make(t.length() + 1, 0L)
      f[0] = 1
      for i = 0; i < t.length(); i = i + 1 {
        for p in patterns {
          if i + p.length() <= t.length() &&
            t.substring(start=i, end=i + p.length()) == p {
            f[i + p.length()] += f[i]
          }
        }
      }
      ans += f[t.length()]
    }
  })
  ans
}
