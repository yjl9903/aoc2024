///|
pub fn solve_day18_hard(n : Int, input : Input) -> String {
  let uf = UnionFindSet::new(n * n)
  let grid = @utils.Grid::new(n, n, init='.')
  input.each(fn {
    p => {
      let _ = grid.set(p, '#')
      ()
    }
  })
  for i in 0..<n {
    for j in 0..<n {
      if grid[i][j] == '.' {
        for nxt in grid.near_pos((i, j)) {
          if grid.get(nxt) == Some('.') {
            let _ = uf.join(i * n + j, nxt.0 * n + nxt.1)
            ()
          }
        }
      }
    }
  }
  let mut i = input.length() - 1
  while i >= 0 {
    let (x, y) = input[i]
    let _ = grid.set((x, y), '.')
    for nxt in grid.near_pos((x, y)) {
      if grid.get(nxt) == Some('.') {
        let _ = uf.join(x * n + y, nxt.0 * n + nxt.1)
        ()
      }
    }
    if uf.is_same(0, (n - 1) * n + (n - 1)) {
      return "\{x},\{y}"
    }
    i -= 1
  }
  ""
}

///|
struct UnionFindSet {
  pre : Array[Int]
}

///|
fn UnionFindSet::new(n : Int) -> UnionFindSet {
  let pre = Array::make(n, 0)
  for i in 0..<n {
    pre[i] = i
  }
  { pre, }
}

///|
fn UnionFindSet::is_same(self : UnionFindSet, x : Int, y : Int) -> Bool {
  self.find(x) == self.find(y)
}

///|
fn UnionFindSet::find(self : UnionFindSet, x : Int) -> Int {
  if x == self.pre[x] {
    x
  } else {
    let par = self.find(self.pre[x])
    self.pre[x] = par
    par
  }
}

///|
fn UnionFindSet::join(self : UnionFindSet, x : Int, y : Int) -> Bool {
  let x = self.find(x)
  let y = self.find(y)
  if x != y {
    self.pre[x] = y
    true
  } else {
    false
  }
}
