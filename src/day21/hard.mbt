///|
pub fn solve_day21_hard(input : Input) -> Output {
  let m = 26
  // let tr1 = predefined_numeric()
  // let tr2 = predefined_directional()
  let tr3 = generate_numeric_all()
  let tr4 = generate_direction_all()
  let mut ans = 0L

  // Solve
  let cache = Map::new()
  fn solve(dep : Int, path : Array[Char]) -> Output {
    if dep == m {
      path.length().to_int64()
    } else {
      let key = String::from_array(path)
      match cache.get((dep, key)) {
        Some(v) => v
        None => {
          let mut len = 0L
          for i in 0..<path.length() {
            let fr = if i == 0 { 'A' } else { path[i - 1] }
            let to = path[i]
            let tr = if dep == 0 { tr3 } else { tr4 }
            let mut min = @int64.max_value
            // println((fr, to))
            // println(tr.get((fr, to)))
            for path in tr.get((fr, to)).unwrap() {
              min = @math.minimum(min, solve(dep + 1, path))
            }
            // println("\{dep} \{fr} \{to} = \{len}")
            len += min
          }
          cache.set((dep, key), len)
          len
        }
      }
    }
  }

  input.each(fn {
    line => {
      let num = @utils.parse_int64(
        line.substring(start=0, end=line.length() - 1),
      )
      // let res = solve(0, line.to_array())
      let res = solve(0, line.to_array())
      println("\{res} \{num}")
      ans += num * res
    }
  })
  ans
}

///|
fn generate_numeric_all() -> Map[(Char, Char), Array[Array[Char]]] {
  let res = Map::new()
  let tr = generate_numeric()
  for st in num_pos.keys() {
    let all = Map::from_iter(num_pos.keys().map(fn { p => (p, []) }))
    let stk = []
    fn dfs(c : Char, pre : Char?) {
      all.get(c).unwrap().push(Array::from_iter(stk.iter().append('A')))
      for d in dir_btns {
        match tr.get((c, d)) {
          Some(n) =>
            if Some(n) != pre {
              stk.push(d)
              let visited = @hashset.from_array(stk)
              if visited.size() <= 2 {
                dfs(n, Some(c))
              }
              let _ = stk.pop()
              ()
            }
          None => ()
        }
      }
    }

    dfs(st, None)
    for ed, all in all {
      // println("\{st} \{ed} : \{all}")
      res.set((st, ed), all)
    }
  }
  res
}

///|
fn generate_direction_all() -> Map[(Char, Char), Array[Array[Char]]] {
  let res = Map::new()
  let tr = generate_direction()
  for st in dir_pos.keys() {
    let all = Map::from_iter(dir_pos.keys().map(fn { p => (p, []) }))
    let stk = []
    fn dfs(c : Char, pre : Char?) {
      all.get(c).unwrap().push(Array::from_iter(stk.iter().append('A')))
      for d in dir_btns {
        match tr.get((c, d)) {
          Some(n) =>
            if Some(n) != pre {
              // Two dirs in use
              stk.push(d)
              let visited = @hashset.from_array(stk)
              if visited.size() <= 2 {
                dfs(n, Some(c))
              }
              let _ = stk.pop()
              ()
            }
          None => ()
        }
      }
    }

    dfs(st, None)
    for ed, all in all {
      // println("\{st} \{ed} : \{all}")
      res.set((st, ed), all)
    }
  }
  res
}

// ///|     +---+---+
// ///|     | ^ | A |
// ///| +---+---+---+
// ///| | < | v | > |
// ///| +---+---+---+
// ///|
// fn predefined_numeric() -> Map[(Char, Char), Array[Char]] {
//   let res = Map::new()
//   for c1, p1 in num_pos {
//     for c2, p2 in num_pos {
//       let cur = []
//       let mut x1 = p1.0
//       let mut y1 = p1.1
//       let x2 = p2.0
//       let y2 = p2.1
//       while y1 < y2 {
//         cur.push('>')
//         y1 += 1
//       }
//       while y1 > y2 {
//         cur.push('<')
//         y1 -= 1
//       }
//       while x1 < x2 {
//         cur.push('v')
//         x1 += 1
//       }
//       while x1 > x2 {
//         cur.push('^')
//         x1 -= 1
//       }

//       // ↕ ↔︎
//       let x1 = p1.0
//       let y1 = p1.1
//       if not(y1 == 0 && x2 == 3) {
//         cur.rev_inplace()
//       }

//       // ↘ = ↓ →
//       // if x1 < x2 && y1 < y2 {
//       //   if y1 != 0 || x2 != 3 {
//       //     cur.rev_inplace()
//       //   }
//       // }
//       // // ↗ = ↑ →
//       // if x1 > x2 && y1 < y2 {
//       //   cur.rev_inplace()
//       // }
//       // // ↙ = ← ↓ 
//       // if x1 < x2 && y1 > y2 {
//       //   // cur.rev_inplace()
//       // }
//       // // ↖ = ↑ ←
//       // if x1 > x2 && y1 > y2 {
//       //   if x1 == 3 && y2 == 0 {
//       //     cur.rev_inplace()
//       //   }
//       // }

//       // Ok
//       cur.push('A')
//       res.set((c1, c2), cur)
//     }
//   }
//   res
// }

// ///|
// fn predefined_directional() -> Map[(Char, Char), Array[Char]] {
//   let res = Map::new()
//   for c1, p1 in dir_pos {
//     for c2, p2 in dir_pos {
//       let cur = []
//       let mut x1 = p1.0
//       let mut y1 = p1.1
//       let x2 = p2.0
//       let y2 = p2.1
//       while y1 < y2 {
//         cur.push('>')
//         y1 += 1
//       }
//       while y1 > y2 {
//         cur.push('<')
//         y1 -= 1
//       }
//       while x1 < x2 {
//         cur.push('v')
//         x1 += 1
//       }
//       while x1 > x2 {
//         cur.push('^')
//         x1 -= 1
//       }

//       // ↕ ↔︎
//       let x1 = p1.0
//       let y1 = p1.1
//       if not(y1 == 0 && x2 == 0) {
//         cur.rev_inplace()
//       }
//       // ↘ = ↓ →
//       // if x1 < x2 && y1 < y2 {
//       //   cur.rev_inplace()
//       // }
//       // // ↗ = ↑ →
//       // if x1 > x2 && y1 < y2 {
//       //   if y1 != 0 || x2 != 1 {
//       //     cur.rev_inplace()
//       //   }
//       // }
//       // // ↙ = ← ↓
//       // if x1 < x2 && y1 > y2 {
//       //   // ↓ ←
//       //   if x1 == 0 && y2 == 0 {
//       //     cur.rev_inplace()
//       //   }
//       // }
//       // // ↖ = ← ↑
//       // if x1 > x2 && y1 > y2 {
//       //   // cur.rev_inplace()
//       // }

//       // Ok
//       cur.push('A')
//       res.set((c1, c2), cur)
//     }
//   }
//   res
// }

///|
// fn generate_distance_direction(
//   initial : Char,
//   depth : Int
// ) -> Map[Char, (Int, String)] {
//   // let tr1 = generate_numeric()
//   let tr2 = generate_direction()
//   let que = @queue.new()
//   let dis = Map::new()
//   let pat = Map::new()
//   let end = Map::new()
//   let m = depth
//   let st = Array::make(m, 'A')
//   st[0] = initial
//   let st = String::from_array(st)
//   que.push(st)
//   dis.set(st, 0)
//   pat.set(st, [])
//   while not(que.is_empty()) {
//     let cur = que.pop().unwrap()
//     // Push <^>v
//     let dir_btns = ['<', '^', '>', 'v']
//     // let num_btns = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
//     for d in dir_btns {
//       match tr2.get((cur[m - 1], d)) {
//         Some(p) => {
//           let nxt = cur.to_array()
//           nxt[m - 1] = p
//           let nxt = String::from_iter(nxt.iter())
//           if not(dis.contains(nxt)) {
//             dis.set(nxt, dis.get(cur).unwrap() + 1)
//             pat.set(
//               nxt,
//               {
//                 let npat = pat.get(cur).unwrap().copy()
//                 npat.push(d)
//                 npat
//               },
//             )
//             que.push(nxt)
//           }
//         }
//         None => ()
//       }
//     }
//     // Push 'A'
//     for j = m - 1; j >= 0; j = j - 1 {
//       let btn = cur[j]
//       if j > 0 {
//         if btn == 'A' {
//           continue
//         } else {
//           let n_btn = cur[j - 1]
//           let tr = if j == 1 { tr2 } else { tr2 }
//           match tr.get((n_btn, btn)) {
//             Some(p) => {
//               let n_nxt = cur.to_array()
//               n_nxt[j - 1] = p
//               let n_nxt = String::from_iter(n_nxt.iter())
//               if not(dis.contains(n_nxt)) {
//                 dis.set(n_nxt, dis.get(cur).unwrap() + 1)
//                 pat.set(
//                   n_nxt,
//                   {
//                     let npat = pat.get(cur).unwrap().copy()
//                     npat.push('A')
//                     npat
//                   },
//                 )
//                 que.push(n_nxt)
//               }
//             }
//             None => ()
//           }
//           break
//         }
//       } else if j == 0 {
//         if not(end.contains(cur[0])) {
//           end.set(
//             cur[0],
//             (
//               dis.get(cur).unwrap() + 1,
//               {
//                 let npat = pat.get(cur).unwrap().copy()
//                 npat.push('A')
//                 String::from_array(npat)
//               },
//             ),
//           )
//         }
//         break
//       } else {
//         panic()
//       }
//     }
//   }
//   end
// }
