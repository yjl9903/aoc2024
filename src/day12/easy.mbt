///|
pub fn solve_day12_easy(input : Input) -> Output {
  let n = input.n
  let m = input.m
  let mut ans = 0
  let visited = @hashset.new()
  fn calc(sx : Int, sy : Int) {
    let queue = @queue.new()
    let color = input[sx][sy]
    let mut area = 0
    let mut border = 0
    queue.push((sx, sy))
    visited.add((sx, sy))
    while not(queue.is_empty()) {
      area += 1
      let cur = queue.pop().unwrap()
      for np in input.near_pos(cur, skip_outside=false) {
        if input.is_inside(np) && input.get(np) == Some(color) {
          if not(visited.contains(np)) {
            visited.add(np)
            queue.push(np)
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
