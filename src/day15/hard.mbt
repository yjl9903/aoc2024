///|
pub fn solve_day15_hard(input : Input) -> Output {
  let grid = get_hard_grid(input.0)
  let mut cur = find_start(grid)
  let _ = grid.set(cur, '.')
  input.1.each(
    fn {
      c => {
        let dir = get_dir(c)
        let nxt = (cur.0 + dir.0, cur.1 + dir.1)
        match grid.get(nxt) {
          Some('#') => ()
          Some('.') => cur = nxt
          Some('[' | ']' as box) =>
            if dir.0 == 0 {
              let mut len = 0
              // .[][][][].
              while grid.get((cur.0, cur.1 + dir.1 * (2 * len + 1))) ==
                    Some(box) {
                len += 1
              }
              if grid.get((cur.0, cur.1 + dir.1 * (2 * len + 1))) == Some('.') {
                let near = if box == '[' { ']' } else { '[' }
                let mut k = 0
                while k < len {
                  let _ = grid.set((cur.0, cur.1 + dir.1 * (2 * k + 2)), box)
                  let _ = grid.set((cur.0, cur.1 + dir.1 * (2 * k + 3)), near)
                  k += 1
                }
                let _ = grid.set(nxt, '.')
                cur = nxt
              }
            } else if dir.1 == 0 {
              let mut banned = false
              let visited = @hashset.new()
              let init_box = if box == '[' {
                (cur.0 + dir.0, cur.1)
              } else {
                (cur.0 + dir.0, cur.1 - 1)
              }
              let queue = @queue.new()
              queue.push(init_box)
              visited.add(init_box)
              while not(queue.is_empty()) {
                let cur_box = queue.pop().unwrap()
                let nxt1 = (cur_box.0 + dir.0, cur_box.1)
                let nxt2 = (cur_box.0 + dir.0, cur_box.1 - 1)
                let nxt3 = (cur_box.0 + dir.0, cur_box.1 + 1)
                // []
                // []
                if grid.get(nxt1) == Some('[') {
                  visited.add(nxt1)
                  queue.push(nxt1)
                } else {
                  // [][]
                  //  []
                  if grid.get(nxt1) == Some(']') {
                    if not(visited.contains(nxt2)) {
                      visited.add(nxt2)
                      queue.push(nxt2)
                    }
                  }
                  if grid.get(nxt3) == Some('[') {
                    if not(visited.contains(nxt3)) {
                      visited.add(nxt3)
                      queue.push(nxt3)
                    }
                  }
                }
                if grid.get(nxt1) == Some('#') || grid.get(nxt3) == Some('#') {
                  banned = true
                }
              }
              if not(banned) {
                // Clear
                visited.each(
                  fn {
                    p => {
                      let _ = grid.set(p, '.')
                      let _ = grid.set((p.0, p.1 + 1), '.')
                      ()
                    }
                  },
                )
                // Move
                visited.each(
                  fn {
                    p => {
                      let _ = grid.set((p.0 + dir.0, p.1), '[')
                      let _ = grid.set((p.0 + dir.0, p.1 + 1), ']')
                      ()
                    }
                  },
                )
                cur = nxt
              }
            } else {
              panic()
            }
          _ => panic()
        }
      }
    },
  )
  let mut ans = 0
  for i in 0..<grid.n {
    for j in 0..<grid.m {
      if grid[i][j] == '[' {
        ans += 100 * i + j
      }
    }
  }
  ans
}

///|
fn get_hard_grid(input : Grid) -> Grid {
  let grid = Grid::new(input.n, input.m * 2)
  for i in 0..<input.n {
    for j in 0..<input.m {
      match input[i][j] {
        '#' => {
          grid[i][j * 2] = '#'
          grid[i][j * 2 + 1] = '#'
        }
        '.' => {
          grid[i][j * 2] = '.'
          grid[i][j * 2 + 1] = '.'
        }
        'O' => {
          grid[i][j * 2] = '['
          grid[i][j * 2 + 1] = ']'
        }
        '@' => {
          grid[i][j * 2] = '@'
          grid[i][j * 2 + 1] = '.'
        }
        _ => panic()
      }
    }
  }
  grid
}
