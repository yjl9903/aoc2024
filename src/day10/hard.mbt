///|
pub fn solve_day10_hard(input : Input) -> Output {
  let n = input.n
  let m = input.m
  let mut ans = 0
  for i in 0..<n {
    for j in 0..<m {
      if input[i][j] == '0' {
        ans += search_path(input, i, j)
      }
    }
  }
  ans
}

///|
fn search_path(grid : Input, x : Int, y : Int) -> Int {
  let dir = [(-1, 0), (0, 1), (1, 0), (0, -1)]
  let visited = Map::new()
  fn dfs(cur : (Int, Int)) -> Int {
    if grid.get(cur) == Some('9') {
      return 1
    }
    match visited.get(cur) {
      Some(v) => return v
      None => ()
    }
    let mut sum = 0
    for d in dir {
      let nx = cur.0 + d.0
      let ny = cur.1 + d.1
      if grid.is_inside((nx, ny)) &&
        grid[nx][ny].to_int() == grid.get(cur).unwrap().to_int() + 1 {
        sum += dfs((nx, ny))
      }
    }
    visited[cur] = sum
    sum
  }

  dfs((x, y))
}
