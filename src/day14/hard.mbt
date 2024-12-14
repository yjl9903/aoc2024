///|
pub fn solve_day14_hard(input : Input) -> Output {
  let n = 103
  let m = 101
  for t in 0..<10000 {
    let grid = @utils.Grid::new(n, m, init=' ')
    input.each(
      fn {
        r => {
          let x = (r.pos.0 + t * r.velocity.0) % n
          let x = (x + n) % n
          let y = (r.pos.1 + t * r.velocity.1) % m
          let y = (y + m) % m
          grid[x][y] = 'O'
        }
      },
    )
    println("--- \{t} ---")
    println(grid)
    println("--- \{t} ---")
    // Then ctrl+f OOOOOOOO to find christmas tree
  }
  0
}
