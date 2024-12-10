///|
pub fn solve_day10_easy(input : Input) -> Output {
  let n = input.n
  let m = input.m
  let mut ans = 0
  for i in 0..<n {
    for j in 0..<m {
      if input[i][j] == '0' {
        ans += search_9(input, i, j)
      }
    }
  }
  ans
}

///|
fn search_9(grid : Input, x : Int, y : Int) -> Int {
  let dir = [(-1, 0), (0, 1), (1, 0), (0, -1)]
  let mut ans = 0
  let visited = @hashset.new()
  let queue = @queue.new()
  queue.push((x, y))
  visited.add((x, y))
  while not(queue.is_empty()) {
    let cur = queue.pop().unwrap()
    if grid.get(cur).unwrap() == '9' {
      ans += 1
    }
    for d in dir {
      let nx = cur.0 + d.0
      let ny = cur.1 + d.1
      if grid.is_inside((nx, ny)) &&
        grid[nx][ny].to_int() == grid.get(cur).unwrap().to_int() + 1 {
        if not(visited.contains((nx, ny))) {
          visited.add((nx, ny))
          queue.push((nx, ny))
        }
      }
    }
  }
  ans
}
