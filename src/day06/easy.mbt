///|
pub fn solve_day06_easy(input : Input) -> Output {
  let n = input.length()
  let m = input[0].length()
  let visited = @hashset.new()
  let cover = @hashset.new()
  let dirs = [
    (-1, 0), // U
    (0, 1), // R
    (1, 0), // D
    // L
    (0, -1),
  ]
  let mut cur = find_start(input)
  let mut dir = 0
  while true {
    if visited.contains((cur, dir)) {
      break
    } else {
      visited.add((cur, dir))
      cover.add(cur)
    }
    let nx = cur.0 + dirs[dir].0
    let ny = cur.1 + dirs[dir].1
    if 0 <= nx && nx < n && 0 <= ny && ny < m {
      if input[nx][ny] != '#' {
        cur = (nx, ny)
        continue
      }
    } else {
      break
    }
    dir = (dir + 1) % 4
  }
  cover.size()
}

///|
fn find_start(input : Input) -> (Int, Int) {
  let n = input.length()
  let m = input[0].length()
  for i = 0; i < n; i = i + 1 {
    for j = 0; j < m; j = j + 1 {
      if input[i][j] == '^' {
        return (i, j)
      }
    }
  }
  panic()
}
