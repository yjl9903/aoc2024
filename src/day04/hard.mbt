///|
pub fn solve_day04_hard(input : Input) -> Output {
  let n = input.length()
  let m = input[0].length()
  let mut ans = 0
  for i = 1; i + 1 < n; i = i + 1 {
    for j = 1; j + 1 < m; j = j + 1 {
      if input[i][j] == 'A' {
        let ul = input[i - 1][j - 1]
        let ur = input[i - 1][j + 1]
        let dl = input[i + 1][j - 1]
        let dr = input[i + 1][j + 1]
        if (ul == 'M' && dr == 'S') || (ul == 'S' && dr == 'M') {
          if (ur == 'M' && dl == 'S') || (ur == 'S' && dl == 'M') {
            ans += 1
          }
        }
      }
    }
  }
  ans
}
