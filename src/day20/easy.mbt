///|
pub fn solve_day20_easy(input : Input) -> Output {
  let st = input.find_pos('S').unwrap()
  let ed = input.find_pos('E').unwrap()
  let _ = input.set(st, '.')
  let _ = input.set(ed, '.')
  let origin = solve(input, st, ed)
  let n = input.n
  let m = input.m
  let mut ans = 0
  for i in 1..<(n - 1) {
    for j in 1..<(m - 1) {
      let cur = (i, j)
      let cc = input.get(cur).unwrap()
      if cc != '#' {
        continue
      }
      // # -> .
      let _ = input.set(cur, '.')
      let d = solve(input, st, ed)
      let _ = input.set(cur, cc)
      for nxt in input.near_pos(cur) {
        let nc = input.get(nxt).unwrap()
        let od = origin.1.get_or_default(nxt, @int.max_value)
        let nd = d.1.get_or_default(nxt, @int.max_value)
        if nc != '#' && nd < od {
          if origin.0 - d.0 >= 100 {
            ans += 1
          }
        }
      }
    }
  }
  ans
}

///|
fn solve(
  grid : Grid,
  st : (Int, Int),
  ed : (Int, Int)
) -> (Int, Map[(Int, Int), Int]) {
  let dis = Map::new()
  let queue = @queue.new()
  queue.push(st)
  dis.set(st, 0)
  while not(queue.is_empty()) {
    let cur = queue.pop().unwrap()
    let len = dis.get(cur).unwrap()
    for nxt in grid.near_pos(cur) {
      if grid.get(nxt).unwrap() != '#' && not(dis.contains(nxt)) {
        dis.set(nxt, len + 1)
        queue.push(nxt)
      }
    }
  }
  (dis.get(ed).unwrap(), dis)
}
