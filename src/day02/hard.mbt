///|
pub fn solve_day02_hard(input : Input) -> Output {
  let mut sum = 0
  input.each(
    fn {
      a =>
        if check_safe(a) {
          sum += 1
        } else {
          for i = 0; i < a.length(); i = i + 1 {
            let a2 = []
            a.eachi(fn { j, x => if i != j { a2.push(x) } })
            if check_safe(a2) {
              sum += 1
              break
            }
          }
        }
    },
  )
  sum
}

///|
fn check_safe(a : Array[Int]) -> Bool {
  if a.length() <= 1 {
    true
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
    flag
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
    flag
  } else {
    false
  }
}
