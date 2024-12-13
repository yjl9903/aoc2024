///|
pub fn solve_day13_easy(input : Input) -> Output {
  let mut ans = 0L
  input.each(
    fn {
      machine => {
        let mut count = 1000000L
        for i in 0..=100 {
          for j in 0..=100 {
            let i = i.to_int64()
            let j = j.to_int64()
            let x = machine.a.0 * i + machine.b.0 * j
            let y = machine.a.1 * i + machine.b.1 * j
            if x == machine.price.0 && y == machine.price.1 {
              count = @math.minimum(count, i * 3 + j)
            }
          }
        }
        if count < 1000000 {
          ans += count
        }
      }
    },
  )
  ans
}
