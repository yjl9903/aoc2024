///|
pub fn solve_day17_hard(input : Input) -> Output {
  let ans = solve(input)
  ans.to_string()
}

///|
fn solve(input : Input) -> Int64 {
  // for i in 0..<8*8*8 {
  //   let r = run({ ..input, a: i.to_int64() })
  //   println("\{i % 8} \{(i / 8) % 8} \{i / 8 / 8}: \{r}")
  // }

  let mut found = -1L
  fn dfs(i : Int, cur : Int64) -> Unit {
    if found != -1L {
      return
    }
    if i == -1 {
      found = cur
      return
    }
    for c in 0..<8 {
      let nxt = cur * 8 + c.to_int64()
      let r = run({ ..input, a: nxt })
      if i + r.length() == input.code.length() {
        let mut ok = true
        for j in 0..<r.length() {
          if r[j] != input.code[i + j] {
            ok = false
          }
        }
        if ok {
          dfs(i - 1, nxt)
        }
      }
    }
  }

  dfs(input.code.length() - 1, 0)
  found
}

///|
// fn quine(input : Input) -> Bool {
//   let code = input.code
//   let ans = []
//   let mut pc = 0
//   let mut a = input.a
//   let mut b = input.b
//   let mut c = input.c
//   fn get_combo(op : Int64) {
//     match op {
//       0 | 1 | 2 | 3 => op
//       4 => a
//       5 => b
//       6 => c
//       _ => panic()
//     }
//   }

//   while pc < code.length() {
//     let inst = code[pc]
//     match inst {
//       0 => {
//         let op = get_combo(code[pc + 1])
//         let value = if op > 63 { 0L } else { a / (1L << op.to_int()) }
//         a = value
//         pc += 2
//       }
//       1 => {
//         let op = code[pc + 1]
//         b = b ^ op
//         pc += 2
//       }
//       2 => {
//         let op = get_combo(code[pc + 1])
//         b = op % 8
//         pc += 2
//       }
//       3 =>
//         if a != 0 {
//           let target = code[pc + 1]
//           pc = target.to_int()
//         } else {
//           pc += 2
//         }
//       4 => {
//         b = b ^ c
//         pc += 2
//       }
//       5 => {
//         let op = get_combo(code[pc + 1]) % 8
//         if ans.length() >= input.code.length() {
//           break
//         }
//         if op == input.code[ans.length()] {
//           ans.push(op)
//           pc += 2
//         } else {
//           break
//         }
//       }
//       6 => {
//         let op = get_combo(code[pc + 1])
//         let value = if op > 63 { 0L } else { a / (1L << op.to_int()) }
//         b = value
//         pc += 2
//       }
//       7 => {
//         let op = get_combo(code[pc + 1])
//         let value = if op > 63 { 0L } else { a / (1L << op.to_int()) }
//         c = value
//         pc += 2
//       }
//       _ => panic()
//     }
//   }
//   ans == input.code
// }

///|
// fn translate(input : Input) -> Array[String] {
//   let code = input.code
//   let ans = []
//   let mut pc = 0
//   fn get_combo(op : Int64) {
//     match op {
//       0 | 1 | 2 | 3 => op.to_string()
//       4 => "a"
//       5 => "b"
//       6 => "c"
//       _ => panic()
//     }
//   }

//   while pc < code.length() {
//     let inst = code[pc]
//     match inst {
//       0 => {
//         let op = get_combo(code[pc + 1])
//         ans.push("a = a / (1LL << \{op})")
//         pc += 2
//       }
//       1 => {
//         let op = code[pc + 1]
//         ans.push("b = b ^ \{op}")
//         pc += 2
//       }
//       2 => {
//         let op = get_combo(code[pc + 1])
//         ans.push("b = \{op} % 8")
//         pc += 2
//       }
//       3 => {
//         let target = code[pc + 1]
//         ans.push("if a != 0 { goto \{target} }")
//         pc += 2
//       }
//       4 => {
//         ans.push("b = b ^ c")
//         pc += 2
//       }
//       5 => {
//         let op = get_combo(code[pc + 1])
//         ans.push("print(\{op} % 8)")
//         pc += 2
//       }
//       6 => {
//         let op = get_combo(code[pc + 1])
//         ans.push("b = a / (1LL << \{op})")
//         pc += 2
//       }
//       7 => {
//         let op = get_combo(code[pc + 1])
//         ans.push("c = a / (1LL << \{op})")
//         pc += 2
//       }
//       _ => panic()
//     }
//   }
//   ans
// }

//
///|
// fn calc(a : Int64) -> Array[Int64] {
//   let ans = []
//   let mut a = a
//   let mut b = 0L
//   let mut c = 0L
//   while true {
//     b = a % 8L
//     b = b ^ 1L
//     c = a / (1L << b.to_int())
//     b = b ^ c
//     a = a / (1L << 3)
//     b = b ^ 6
//     ans.push(b % 8)
//     if a == 0 {
//       break
//     }
//   }
//   ans
// }
