///|
pub fn solve_day12_hard(input : Input) -> Output {
  let n = input.n
  let m = input.m
  let mut ans = 0
  let visited = @hashset.new()
  fn calc(sx : Int, sy : Int) {
    let color = input[sx][sy]
    let queue = @queue.new()
    let current = @hashset.new()
    let mut area = 0
    let mut border = 0
    queue.push((sx, sy))
    visited.add((sx, sy))
    current.add((sx, sy))
    while not(queue.is_empty()) {
      area += 1
      let cur = queue.pop().unwrap()
      for np in input.near_pos(cur) {
        if input.get(np) == Some(color) {
          if not(visited.contains(np)) {
            visited.add(np)
            current.add(np)
            queue.push(np)
          }
        }
      }
    }
    for i in 0..<n {
      let mut j = 0
      while j < m {
        if current.contains((i, j)) && not(current.contains((i - 1, j))) {
          while j < m &&
                current.contains((i, j)) &&
                not(current.contains((i - 1, j))) {
            j += 1
          }
          border += 1
        } else {
          j += 1
        }
      }
    }
    for i in 0..<n {
      let mut j = 0
      while j < m {
        if current.contains((i, j)) && not(current.contains((i + 1, j))) {
          while j < m &&
                current.contains((i, j)) &&
                not(current.contains((i + 1, j))) {
            j += 1
          }
          border += 1
        } else {
          j += 1
        }
      }
    }
    for j in 0..<m {
      let mut i = 0
      while i < n {
        if current.contains((i, j)) && not(current.contains((i, j - 1))) {
          while j < m &&
                current.contains((i, j)) &&
                not(current.contains((i, j - 1))) {
            i += 1
          }
          border += 1
        } else {
          i += 1
        }
      }
    }
    for j in 0..<m {
      let mut i = 0
      while i < n {
        if current.contains((i, j)) && not(current.contains((i, j + 1))) {
          while j < m &&
                current.contains((i, j)) &&
                not(current.contains((i, j + 1))) {
            i += 1
          }
          border += 1
        } else {
          i += 1
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
