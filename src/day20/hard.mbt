///|
pub fn solve_day20_hard(input : Input) -> Output {
  let st = input.find_pos('S').unwrap()
  let ed = input.find_pos('E').unwrap()
  let _ = input.set(st, '.')
  let _ = input.set(ed, '.')
  let (od1, st_dis) = solve(input, st, ed)
  let (od2, ed_dis) = solve(input, ed, st)
  let od = if od1 == od2 { od1 } else { panic() }
  let n = input.n
  let m = input.m
  let mut ans = 0
  for i in 0..<n {
    for j in 0..<m {
      let cur = (i, j)
      let cc = input.get(cur).unwrap()
      if cc == '#' {
        continue
      }
      let d1 = match st_dis.get(cur) {
        Some(d) => d
        None => continue
      }
      let cheat = 20
      for dx in -cheat..=cheat {
        for dy in -cheat..=cheat {
          let i2 = i + dx
          let j2 = j + dy
          if not(input.is_inside((i2, j2))) {
            continue
          }
          // 1 <= cheat <= 20
          if @int.abs(i - i2) + @int.abs(j - j2) > cheat ||
            @int.abs(i - i2) + @int.abs(j - j2) == 0 {
            continue
          }
          let nxt = (i2, j2)
          let nc = input.get(nxt).unwrap()
          if nc == '#' {
            continue
          }
          let d2 = match ed_dis.get(nxt) {
            Some(d) => d
            None => continue
          }
          let nd = d1 + @int.abs(i - i2) + @int.abs(j - j2) + d2
          if od - nd >= 100 {
            ans += 1
          }
        }
      }
    }
  }
  ans
}
