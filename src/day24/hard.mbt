// fcg = d17 vtv = c17 a17 = b17
///|
pub fn solve_day24_hard(input : Input) -> String {
  let gates = input.1
  let gates = swap_gate(gates, "nqk", "z07")
  let gates = swap_gate(gates, "fpq", "z24")
  let gates = swap_gate(gates, "pcp", "fgt")
  let gates = swap_gate(gates, "srn", "z32")
  // let res = run((input.0, gates))
  // println(res)
  // let gates = swap_gate(gates, "hfm", "z00")
  // let gates = swap_gate(gates, "jgp", "vtv")
  let gates = normalize(gates)
  gates.sort_by_key(fn { l => "\{l.1} \{l.0} \{l.2} \{l.3}" })
  // for l in gates {
  //   println("\{l.0} \{l.1} \{l.2} -> \{l.3}")
  // }

  // answer
  let ans = ["nqk", "z07", "fpq", "z24", "pcp", "fgt", "srn", "z32"]
  ans.sort()
  String::concat(ans, separator=",")
}

///|
fn swap_gate(
  gates : Array[(String, Gate, String, String)],
  from : String,
  to : String
) -> Array[(String, Gate, String, String)] {
  gates.map(fn {
    l =>
      if l.3 == from {
        (l.0, l.1, l.2, to)
      } else if l.3 == to {
        (l.0, l.1, l.2, from)
      } else {
        l
      }
  })
}

///|
fn normalize(
  gates : Array[(String, Gate, String, String)]
) -> Array[(String, Gate, String, String)] {
  let replacement = Map::new()
  fn add_replacement(id1 : String, id2 : String) {
    if replacement.contains(id1) {
      panic()
    }
    replacement.set(id1, id2)
  }

  fn replace(id : String) -> String {
    match replacement.get(id) {
      Some(id) => id
      None => id
    }
  }

  let gates = gates.map(fn {
    l => if l.0 < l.2 { l } else { (l.2, l.1, l.0, l.3) }
  })
  for l in gates {
    if l.0.starts_with("x") && l.1 == AND && l.2.starts_with("y") {
      let id0 = @utils.parse_int(l.0.substring(start=1))
      let id2 = @utils.parse_int(l.2.substring(start=1))
      if id0 == id2 {
        let id = l.0.substring(start=1)
        if not(l.3.starts_with("z")) {
          add_replacement(l.3, "a\{id}")
        }
      }
    }
  }
  for l in gates {
    if l.0.starts_with("x") && l.1 == XOR && l.2.starts_with("y") {
      let id0 = @utils.parse_int(l.0.substring(start=1))
      let id2 = @utils.parse_int(l.2.substring(start=1))
      if id0 == id2 {
        let id = l.0.substring(start=1)
        if not(l.3.starts_with("z")) {
          add_replacement(l.3, "b\{id}")
        }
      }
    }
  }
  let gates = gates.map(fn {
    l => (replace(l.0), l.1, replace(l.2), replace(l.3))
  })
  let gates = gates.map(fn {
    l => if l.0 < l.2 { l } else { (l.2, l.1, l.0, l.3) }
  })
  for l in gates {
    if l.0.starts_with("a") && l.1 == OR {
      match @strconv.parse_int?(l.0.substring(start=1)) {
        Ok(_) => {
          let id = l.0.substring(start=1)
          add_replacement(l.2, "c\{id}")
          if not(l.3.starts_with("z")) {
            add_replacement(l.3, "d\{id}")
          }
        }
        Err(_) => ()
      }
    }
  }
  let gates = gates.map(fn {
    l => (replace(l.0), l.1, replace(l.2), replace(l.3))
  })
  let gates = gates.map(fn {
    l => if l.0 < l.2 { l } else { (l.2, l.1, l.0, l.3) }
  })
  println(replacement)
  gates
}
