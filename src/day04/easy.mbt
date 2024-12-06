///|
pub fn solve_day04_easy(input : Input) -> Output {
  let n = input.length()
  let m = input[0].length()
  let mut ans = 0
  for i = 0; i < n; i = i + 1 {
    for j = 0; j + 3 < m; j = j + 1 {
      if input[i][j] == 'X' &&
        input[i][j + 1] == 'M' &&
        input[i][j + 2] == 'A' &&
        input[i][j + 3] == 'S' {
        ans += 1
      }
    }
    for j = 0; j + 3 < m; j = j + 1 {
      if input[i][j] == 'S' &&
        input[i][j + 1] == 'A' &&
        input[i][j + 2] == 'M' &&
        input[i][j + 3] == 'X' {
        ans += 1
      }
    }
  }
  for i = 0; i < m; i = i + 1 {
    for j = 0; j + 3 < n; j = j + 1 {
      if input[j][i] == 'X' &&
        input[j + 1][i] == 'M' &&
        input[j + 2][i] == 'A' &&
        input[j + 3][i] == 'S' {
        ans += 1
      }
    }
    for j = 0; j + 3 < m; j = j + 1 {
      if input[j][i] == 'S' &&
        input[j + 1][i] == 'A' &&
        input[j + 2][i] == 'M' &&
        input[j + 3][i] == 'X' {
        ans += 1
      }
    }
  }
  for i = 0; i + 3 < n; i = i + 1 {
    for j = 0; j + 3 < m; j = j + 1 {
      if input[i][j] == 'X' &&
        input[i + 1][j + 1] == 'M' &&
        input[i + 2][j + 2] == 'A' &&
        input[i + 3][j + 3] == 'S' {
        ans += 1
      } else if input[i][j] == 'S' &&
        input[i + 1][j + 1] == 'A' &&
        input[i + 2][j + 2] == 'M' &&
        input[i + 3][j + 3] == 'X' {
        ans += 1
      }
    }
  }
  for i = 3; i < n; i = i + 1 {
    for j = 0; j + 3 < m; j = j + 1 {
      if input[i][j] == 'X' &&
        input[i - 1][j + 1] == 'M' &&
        input[i - 2][j + 2] == 'A' &&
        input[i - 3][j + 3] == 'S' {
        ans += 1
      } else if input[i][j] == 'S' &&
        input[i - 1][j + 1] == 'A' &&
        input[i - 2][j + 2] == 'M' &&
        input[i - 3][j + 3] == 'X' {
        ans += 1
      }
    }
  }
  ans
}
