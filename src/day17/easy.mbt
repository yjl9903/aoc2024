///|
pub fn solve_day17_easy(input : Input) -> Output {
  let ans = run(input)
  String::concat(ans.map(fn { a => a.to_string() }), separator=",")
}

///|
fn run(input : Input) -> Array[Int64] {
  let code = input.code
  let ans = []
  let mut pc = 0
  let mut a = input.a
  let mut b = input.b
  let mut c = input.c
  fn get_combo(op : Int64) {
    match op {
      0 | 1 | 2 | 3 => op
      4 => a
      5 => b
      6 => c
      _ => panic()
    }
  }

  while pc < code.length() {
    let inst = code[pc]
    match inst {
      0 => {
        let op = get_combo(code[pc + 1])
        let value = if op > 100 { 0L } else { a / (1L << op.to_int()) }
        a = value
        pc += 2
      }
      1 => {
        let op = code[pc + 1]
        b = b ^ op
        pc += 2
      }
      2 => {
        let op = get_combo(code[pc + 1])
        b = op % 8
        pc += 2
      }
      3 =>
        if a != 0 {
          let target = code[pc + 1]
          pc = target.to_int()
        } else {
          pc += 2
        }
      4 => {
        b = b ^ c
        pc += 2
      }
      5 => {
        let op = get_combo(code[pc + 1]) % 8
        ans.push(op)
        pc += 2
      }
      6 => {
        let op = get_combo(code[pc + 1])
        let value = if op > 100 { 0L } else { a / (1L << op.to_int()) }
        b = value
        pc += 2
      }
      7 => {
        let op = get_combo(code[pc + 1])
        let value = if op > 100 { 0L } else { a / (1L << op.to_int()) }
        c = value
        pc += 2
      }
      _ => panic()
    }
  }
  ans
}
