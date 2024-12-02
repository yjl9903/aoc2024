pub fn solve_day02_easy(input : Input) -> Output {
  let mut sum = 0
  input.each(
    fn {
      a =>
        if a.length() <= 1 {
          sum += 1
        } else if a[0] < a[1] {
          let mut flag = true
          for i = 1; i < a.length(); i = i + 1 {
            if a[i - 1] < a[i] && 1 <= a[i] - a[i - 1] && a[i] - a[i - 1] <= 3 {
              ()
            } else {
              flag = false
              break
            }
          }
          if flag {
            sum += 1
          }
        } else if a[0] > a[1] {
          let mut flag = true
          for i = 1; i < a.length(); i = i + 1 {
            if a[i - 1] > a[i] && 1 <= a[i - 1] - a[i] && a[i - 1] - a[i] <= 3 {
              ()
            } else {
              flag = false
              break
            }
          }
          if flag {
            sum += 1
          }
        }
    },
  )
  sum
}
