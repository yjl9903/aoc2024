///|
pub fn solve_day07_easy(input : Input) -> Output {
  let mut ans = 0L
  input.each(
    fn {
      equation => {
        let (lhs, rhs) = equation
        let n = rhs.length()
        for s in 0..<(1 << (n - 1)) {
          // let mut sum = 0L
          let mut cur = rhs[0]
          for i in 0..<(n - 1) {
            if ((s >> i) & 1) == 0 {
              cur *= rhs[i + 1]
            } else {
              cur += rhs[i + 1]
            }
          }
          // sum += cur
          if cur == lhs {
            ans += cur
            break
          }
        }
      }
    },
  )
  ans
}
