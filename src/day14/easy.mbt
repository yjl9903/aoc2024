///|
pub fn solve_day14_easy(input : Input) -> Output {
  // example: 7, 11
  let n = 103
  let m = 101
  let t = 100
  let res = [0L, 0L, 0L, 0L]
  input.each(
    fn {
      r => {
        let x = (r.pos.0 + t * r.velocity.0) % n
        let x = (x + n) % n
        let y = (r.pos.1 + t * r.velocity.1) % m
        let y = (y + m) % m
        if x < n / 2 && y < m / 2 {
          res[0] += 1
        } else if x < n / 2 && y > m / 2 {
          res[1] += 1
        } else if x > n / 2 && y < m / 2 {
          res[2] += 1
        } else if x > n / 2 && y > m / 2 {
          res[3] += 1
        }
      }
    },
  )
  res[0] * res[1] * res[2] * res[3]
}
