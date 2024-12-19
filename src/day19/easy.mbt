///|
pub fn solve_day19_easy(input : Input) -> Output {
  let patterns = input.0
  let targets = input.1
  let mut ans = 0
  targets.each(fn {
    t => {
      let f = Array::make(t.length() + 1, 0)
      f[0] = 1
      for i = 0; i < t.length(); i = i + 1 {
        if f[i] == 0 {
          continue
        }
        for p in patterns {
          if i + p.length() <= t.length() &&
            t.substring(start=i, end=i + p.length()) == p {
            f[i + p.length()] = 1
          }
        }
      }
      if f[t.length()] == 1 {
        ans += 1
      }
    }
  })
  ans
}
