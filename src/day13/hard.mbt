///|
pub fn solve_day13_hard(input : Input) -> Output {
  let input = input.map(
    fn {
      m =>
        { ..m, price: (m.price.0 + 10000000000000, m.price.1 + 10000000000000) }
    },
  )

  //
  let mut ans = 0L
  input.each(
    fn {
      machine => {
        let j1 = machine.a.1 * machine.price.0 - machine.a.0 * machine.price.1
        let j2 = machine.a.1 * machine.b.0 - machine.a.0 * machine.b.1
        if j2 != 0 && j1 % j2 == 0 {
          let j = j1 / j2
          let i1 = machine.price.0 - machine.b.0 * j
          let i2 = machine.a.0
          if i2 != 0 && i1 % i2 == 0 {
            let i = i1 / i2
            if i >= 0 && j >= 0 {
              let x = machine.a.0 * i + machine.b.0 * j
              let y = machine.a.1 * i + machine.b.1 * j
              if x == machine.price.0 && y == machine.price.1 {
                ans += 3L * i + j
              }
            }
          }
        }
      }
    },
  )
  ans
}

///|
// fn gcd(a : Int64, b : Int64) -> Int64 {
//   if b == 0 {
//     a
//   } else {
//     gcd(b, a % b)
//   }
// }

///|
// fn ex_gcd(a : Int64, b : Int64) -> (Int64, Int64, Int64) {
//   let mut x = 1L
//   let mut y = 0L
//   let mut x1 = 0L
//   let mut y1 = 1L
//   let mut a1 = a
//   let mut b1 = b
//   while b1 != 0 {
//     let q = a1 / b1
//     let t = (x1, x - q * x1)
//     x = t.0
//     x1 = t.1
//     // tie(x, x1) = make_tuple(x1, x - q * x1);
//     let t = (y1, y - q * y1)
//     y = t.0
//     y1 = t.1
//     // tie(y, y1) = make_tuple(y1, y - q * y1);
//     let t = (b1, a1 - q * b1)
//     a1 = t.0
//     b1 = t.1
//     // tie(a1, b1) = make_tuple(b1, a1 - q * b1);
//   }
//   return (a1, x, y)
// }
