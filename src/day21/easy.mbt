///|
pub fn solve_day21_easy(input : Input) -> Int64 {
  let trs = Map::from_iter(
    num_pos.keys().map(fn { p => (p, generate_distance(p, 3)) }),
  )
  let mut ans = 0L
  input.each(fn {
    path => {
      let num = @utils.parse_int64(
        path.substring(start=0, end=path.length() - 1),
      )
      let path = path.to_array()
      let mut len = 0
      for i in 0..<path.length() {
        let f = path.get(i - 1).or('A')
        let t = path.get(i).unwrap()
        let d = trs.get(f).unwrap().get(t).unwrap()
        len += d
      }
      println("\{len} * \{num}")
      ans += num * len.to_int64()
    }
    // let cur1 = []
    // for i in 0..<line.length() {
    //   let x1 = if i == 0 { 'A' } else { line[i - 1] }
    //   let x2 = line[i]
    //   cur1.push_iter(tr1.get((x1, x2)).unwrap().iter())
    //   cur1.push('A')
    // }
    // let cur2 = []
    // for i in 0..<cur1.length() {
    //   let x1 = if i == 0 { 'A' } else { cur1[i - 1] }
    //   let x2 = cur1[i]
    //   cur2.push_iter(tr2.get((x1, x2)).unwrap().iter())
    //   cur2.push('A')
    // }
    // let cur3 = []
    // for i in 0..<cur2.length() {
    //   let x1 = if i == 0 { 'A' } else { cur2[i - 1] }
    //   let x2 = cur2[i]
    //   cur3.push_iter(tr2.get((x1, x2)).unwrap().iter())
    //   cur3.push('A')
    // }
    // let num = @utils.parse_int64(
    //   line.substring(start=0, end=line.length() - 1),
    // )
    // println(String::concat(cur1.map(fn { c => c.to_string() }), separator=""))
    // println(String::concat(cur2.map(fn { c => c.to_string() }), separator=""))
    // println(String::concat(cur3.map(fn { c => c.to_string() }), separator=""))
    // println("\{cur3.length()} * \{num}")
    // ans += num * cur3.length().to_int64()
  })
  ans
}

///|
let num_pos : Map[Char, (Int, Int)] = Map::from_array([
  ('7', (0, 0)),
  ('8', (0, 1)),
  ('9', (0, 2)),
  ('4', (1, 0)),
  ('5', (1, 1)),
  ('6', (1, 2)),
  ('1', (2, 0)),
  ('2', (2, 1)),
  ('3', (2, 2)),
  ('0', (3, 1)),
  ('A', (3, 2)),
])

///|
let dir_pos : Map[Char, (Int, Int)] = Map::from_array([
  ('^', (0, 1)),
  ('A', (0, 2)),
  ('<', (1, 0)),
  ('v', (1, 1)),
  ('>', (1, 2)),
])

///|
let dir_btns = ['<', '^', '>', 'v']

///|
// fn generate_direction_direction() -> Map[(Char, Char), Int] {
//   // A -> ..., 0 -> ..., ...
//   let tr1 = generate_direction_all()
//   let tr2 = generate_direction_distance()
//   let res = Map::new()
//   for edge, paths in tr1 {
//     let mut min = @int.max_value
//     for path in paths {
//       let mut len = 0
//       for i in 0..<(path.length() + 1) {
//         let f = path.get(i - 1).or('A')
//         let t = path.get(i).or('A')
//         let d = tr2.get((f, t)).unwrap().length()
//         len += d + 1
//       }
//       min = @math.minimum(min, len)
//     }
//     res.set(edge, min)
//     // println("\{edge} \{paths.length()} \{res.get(edge).unwrap()}")
//   }
//   res
// }

///|
// fn generate_numeric_direction_direction() -> Map[(Char, Char), Int] {
//   let tr1 = generate_numeric_all()
//   let tr2 = generate_direction_direction()
//   let res = Map::new()
//   for edge, paths in tr1 {
//     let mut min = @int.max_value
//     for path in paths {
//       let mut len = 0
//       for i in 0..<(path.length() + 1) {
//         let f = path.get(i - 1).or('A')
//         let t = path.get(i).or('A')
//         let d = tr2.get((f, t)).unwrap()
//         len += d + 1
//       }
//       min = @math.minimum(min, len)
//     }
//     res.set(edge, min)
//     // println("\{edge} \{paths.length()} \{res.get(edge).unwrap()}")
//   }
//   res
// }

///| AAA -> 0AA -> 1AA -> 2AA -> 9AA
fn generate_distance(initial : Char, depth : Int) -> Map[Char, Int] {
  let tr1 = generate_numeric()
  let tr2 = generate_direction()
  let que = @queue.new()
  let dis = Map::new()
  let end = Map::new()
  let m = depth
  let st = Array::make(m, 'A')
  st[0] = initial
  let st = String::from_array(st)
  que.push(st)
  dis.set(st, 0)
  while not(que.is_empty()) {
    let cur = que.pop().unwrap()
    // Push <^>v
    let dir_btns = ['<', '^', '>', 'v']
    // let num_btns = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
    for d in dir_btns {
      match tr2.get((cur[m - 1], d)) {
        Some(p) => {
          let nxt = cur.to_array()
          nxt[m - 1] = p
          let nxt = String::from_iter(nxt.iter())
          if not(dis.contains(nxt)) {
            dis.set(nxt, dis.get(cur).unwrap() + 1)
            que.push(nxt)
          }
        }
        None => ()
      }
    }
    // Push 'A'
    for j = m - 1; j >= 0; j = j - 1 {
      let btn = cur[j]
      if j > 0 {
        if btn == 'A' {
          continue
        } else {
          let n_btn = cur[j - 1]
          let tr = if j == 1 { tr1 } else { tr2 }
          match tr.get((n_btn, btn)) {
            Some(p) => {
              let n_nxt = cur.to_array()
              n_nxt[j - 1] = p
              let n_nxt = String::from_iter(n_nxt.iter())
              if not(dis.contains(n_nxt)) {
                dis.set(n_nxt, dis.get(cur).unwrap() + 1)
                que.push(n_nxt)
              }
            }
            None => ()
          }
          break
        }
      } else if j == 0 {
        if not(end.contains(cur[0])) {
          end.set(cur[0], dis.get(cur).unwrap() + 1)
        }
        break
      } else {
        panic()
      }
    }
  }
  end
}

///|
fn generate_numeric() -> Map[(Char, Char), Char] {
  let res = Map::new()
  let pos = Map::from_array([
    ('7', (0, 0)),
    ('8', (0, 1)),
    ('9', (0, 2)),
    ('4', (1, 0)),
    ('5', (1, 1)),
    ('6', (1, 2)),
    ('1', (2, 0)),
    ('2', (2, 1)),
    ('3', (2, 2)),
    ('0', (3, 1)),
    ('A', (3, 2)),
  ])
  for st, ps in pos {
    for ed, es in pos {
      let cur = []
      let mut x = ps.0
      let mut y = ps.1
      if y <= es.1 {
        // S..
        // ..E
        while y < es.1 {
          cur.push('>')
          y += 1
        }
        while x < es.0 {
          cur.push('v')
          x += 1
        }
        while x > es.0 {
          cur.push('^')
          x -= 1
        }
      } else {
        while x < es.0 {
          cur.push('v')
          x += 1
        }
        while x > es.0 {
          cur.push('^')
          x -= 1
        }
        while y > es.1 {
          cur.push('<')
          y -= 1
        }
      }
      // println("\{st} -> \{ed} : \{cur}")
      if cur.length() == 1 {
        res.set((st, cur[0]), ed)
      }
    }
  }
  res
}

///|
fn generate_direction() -> Map[(Char, Char), Char] {
  let res = Map::new()
  let pos = Map::from_array([
    ('^', (0, 1)),
    ('A', (0, 2)),
    ('<', (1, 0)),
    ('v', (1, 1)),
    ('>', (1, 2)),
  ])
  for st, ps in pos {
    for ed, es in pos {
      let cur = []
      let mut x = ps.0
      let mut y = ps.1
      if y <= es.1 {
        // S..
        // ..E
        while y < es.1 {
          cur.push('>')
          y += 1
        }
        while x < es.0 {
          cur.push('v')
          x += 1
        }
        while x > es.0 {
          cur.push('^')
          x -= 1
        }
      } else {
        while x < es.0 {
          cur.push('v')
          x += 1
        }
        while x > es.0 {
          cur.push('^')
          x -= 1
        }
        while y > es.1 {
          cur.push('<')
          y -= 1
        }
      }
      // println("\{st} -> \{ed} : \{cur}")
      if cur.length() == 1 {
        res.set((st, cur[0]), ed)
      }
    }
  }
  res
}

///|
// fn generate_direction_distance() -> Map[(Char, Char), Array[Char]] {
//   let res = Map::new()
//   let pos = Map::from_array([
//     ('^', (0, 1)),
//     ('A', (0, 2)),
//     ('<', (1, 0)),
//     ('v', (1, 1)),
//     ('>', (1, 2)),
//   ])
//   for st, ps in pos {
//     for ed, es in pos {
//       let cur = []
//       let mut x = ps.0
//       let mut y = ps.1
//       if y <= es.1 {
//         // S..
//         // ..E
//         while y < es.1 {
//           cur.push('>')
//           y += 1
//         }
//         while x < es.0 {
//           cur.push('v')
//           x += 1
//         }
//         while x > es.0 {
//           cur.push('^')
//           x -= 1
//         }
//       } else {
//         while x < es.0 {
//           cur.push('v')
//           x += 1
//         }
//         while x > es.0 {
//           cur.push('^')
//           x -= 1
//         }
//         while y > es.1 {
//           cur.push('<')
//           y -= 1
//         }
//       }
//       // println("\{st} -> \{ed} : \{cur}")
//       res.set((st, ed), cur)
//     }
//   }
//   res
// }
