///|
pub fn solve_day06_hard(input : Input) -> Output {
  let n = input.n
  let m = input.m
  let mut ans = 0
  for i in 0..<n {
    for j in 0..<m {
      if input[i][j] == '.' {
        input[i][j] = '#'
        if solve_easy(input) {
          ans += 1
        }
        input[i][j] = '.'
      }
    }
  }
  ans
}

///|
fn solve_easy(input : Input) -> Bool {
  let visited = @hashset.new()
  let cover = @hashset.new()
  let dirs = [
    (-1, 0), // U
    (0, 1), // R
    (1, 0), // D
    (0, -1),
  ] // L
  let mut cur = find_start(input)
  let mut dir = 0
  while true {
    if visited.contains((cur, dir)) {
      return true
    } else {
      visited.add((cur, dir))
      cover.add(cur)
    }
    let nx = cur.0 + dirs[dir].0
    let ny = cur.1 + dirs[dir].1
    if input.is_inside((nx, ny)) {
      if input[nx][ny] != '#' {
        cur = (nx, ny)
        continue
      }
    } else {
      break
    }
    dir = (dir + 1) % 4
  }
  false
}
