///|
pub fn solve_day15_easy(input : Input) -> Output {
  let grid = input.0
  let cmd = input.1
  let mut cur = find_start(grid)
  let _ = grid.set(cur, '.')
  cmd.each(
    fn {
      c => {
        let dir = get_dir(c)
        let nxt = (cur.0 + dir.0, cur.1 + dir.1)
        match grid.get(nxt) {
          Some('#') => ()
          Some('.') => cur = nxt
          Some('O') => {
            let mut len = 1
            while grid.get((cur.0 + dir.0 * len, cur.1 + dir.1 * len)) ==
                  Some('O') {
              len += 1
            }
            if grid.get((cur.0 + dir.0 * len, cur.1 + dir.1 * len)) == Some('.') {
              let _ = grid.set((cur.0 + dir.0 * len, cur.1 + dir.1 * len), 'O')
              let _ = grid.set((cur.0 + dir.0, cur.1 + dir.1), '.')
              cur = nxt
            }
          }
          _ => panic()
        }
      }
    },
  )
  let mut ans = 0
  for i in 0..<grid.n {
    for j in 0..<grid.m {
      if grid[i][j] == 'O' {
        ans += 100 * i + j
      }
    }
  }
  ans
}

///|
fn find_start(grid : Grid) -> (Int, Int) {
  for i in 0..<grid.n {
    for j in 0..<grid.m {
      if grid[i][j] == '@' {
        return (i, j)
      }
    }
  }
  panic()
}

///|
fn get_dir(c : Char) -> (Int, Int) {
  match c {
    '^' => (-1, 0)
    '>' => (0, 1)
    'v' => (1, 0)
    '<' => (0, -1)
    _ => (0, 0)
  }
}
