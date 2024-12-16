///|
pub fn solve_day16_hard(input : Input) -> Output {
  let four_dirs = [(-1, 0), (0, 1), (1, 0), (0, -1)]
  let st = input.find_pos('S').unwrap()
  let ed = input.find_pos('E').unwrap()
  let _ = input.set(st, '.')
  let _ = input.set(ed, '.')
  let pq = @priority_queue.new()
  let dis = Map::new()
  let mut len = @int.max_value
  pq.push((0, st, 1))
  while not(pq.is_empty()) {
    let cur = pq.pop().unwrap()
    let pos = cur.1
    let dir = cur.2
    match dis.get((pos, dir)) {
      Some(v) => if cur.0 > v { continue }
      None => dis.set((pos, dir), cur.0)
    }
    if pos == ed {
      len = @math.minimum(len, cur.0)
    }
    fn next(nxt, dir, cost) {
      if input.is_inside(nxt) && input.get(nxt) == Some('.') {
        match dis.get((nxt, dir)) {
          Some(v) =>
            if cur.0 + cost < v {
              dis.set((nxt, dir), cur.0 + cost)
              pq.push((cur.0 + cost, nxt, dir))
            }
          None => {
            dis.set((nxt, dir), cur.0 + cost)
            pq.push((cur.0 + cost, nxt, dir))
          }
        }
      }
    }

    next(Grid::next(pos, four_dirs[dir]), dir, 1)
    next(pos, (dir + 1) % 4, 1000)
    next(pos, (dir + 3) % 4, 1000)
  }
  let visited = @hashset.new()
  let covered = @hashset.new()
  fn dfs(pos : (Int, Int), dir : Int) {
    if visited.contains((pos, dir)) {
      return
    }
    visited.add((pos, dir))
    covered.add(pos)
    match dis.get((pos, dir)) {
      Some(value) => {
        fn next(np, nd, cost) {
          match dis.get((np, nd)) {
            Some(pre) => if pre + cost == value { dfs(np, nd) }
            None => ()
          }
        }

        next((pos.0 - four_dirs[dir].0, pos.1 - four_dirs[dir].1), dir, 1)
        next(pos, (dir + 1) % 4, 1000)
        next(pos, (dir + 3) % 4, 1000)
        ()
      }
      None => ()
    }
  }

  dfs(ed, 0)
  dfs(ed, 1)
  dfs(ed, 2)
  dfs(ed, 3)
  covered.size()
}
