///|
pub fn solve_day16_easy(input : Input) -> Output {
  let four_dirs = [(-1, 0), (0, 1), (1, 0), (0, -1)]
  let st = input.find_pos('S').unwrap()
  let ed = input.find_pos('E').unwrap()
  let _ = input.set(st, '.')
  let _ = input.set(ed, '.')
  let pq = @priority_queue.new()
  let dis = Map::new()
  let mut ans = @int.max_value
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
      ans = @math.minimum(ans, cur.0)
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
  ans
}
