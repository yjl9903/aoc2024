///|
pub fn solve_day18_easy(n : Int, f : Int, input : Input) -> Output {
  let grid = @utils.Grid::new(n, n, init='.')
  for i in 0..<f {
    let (y, x) = input[i]
    let _ = grid.set((y, x), '#')
    ()
  }
  let dis = Map::new()
  let queue = @queue.new()
  dis.set((0, 0), 0)
  queue.push((0, 0))
  while not(queue.is_empty()) {
    let cur = queue.pop().unwrap()
    if cur == (n - 1, n - 1) {
      return dis.get((n - 1, n - 1)).unwrap()
    }
    for next in grid.near_pos(cur) {
      if grid.get(next) == Some('.') && not(dis.contains(next)) {
        dis.set(next, dis.get(cur).unwrap() + 1)
        queue.push(next)
      }
    }
  }
  dis.get((n - 1, n - 1)).unwrap()
}
