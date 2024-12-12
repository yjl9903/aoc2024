///|
pub fn solve_day12_easy(input : Input) -> Output {
  let n = input.n
  let m = input.m
  let mut ans = 0
  let visited = @hashset.new()
  fn calc(sx : Int, sy : Int) {
    let dir = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    let queue = @queue.new()
    let color = input[sx][sy]
    let mut area = 0
    let mut border = 0
    queue.push((sx, sy))
    visited.add((sx, sy))
    while not(queue.is_empty()) {
      area += 1
      let cur = queue.pop().unwrap()
      for d in dir {
        let nx = cur.0 + d.0
        let ny = cur.1 + d.1
        if input.is_inside((nx, ny)) && input[nx][ny] == color {
          if not(visited.contains((nx, ny))) {
            visited.add((nx, ny))
            queue.push((nx, ny))
          }
        } else {
          border += 1
        }
      }
    }
    area * border
  }

  for i in 0..<n {
    for j in 0..<m {
      if not(visited.contains((i, j))) {
        ans += calc(i, j)
      }
    }
  }
  ans
}
