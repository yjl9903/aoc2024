///| Grid abstraction
pub(readonly) struct Grid {
  n : Int
  m : Int
  map : Array[Array[Char]]
} derive(Eq)

///|
pub fn Grid::output(self : Grid, logger : Logger) -> Unit {
  logger.write_string(self.to_string())
}

///|
pub fn Grid::to_string(self : Grid) -> String {
  let builder = StringBuilder::new()
  for i, line in self.map.iter2() {
    if i > 0 {
      builder.write_char('\n')
    }
    builder.write_string(line.to_string())
  }
  builder.to_string()
}

///| Get line of grid
pub fn Grid::op_get(self : Grid, idx : Int) -> Array[Char] {
  self.map[idx]
}

///| Get char in pos
pub fn Grid::get(self : Grid, pos : (Int, Int)) -> Char? {
  if self.is_inside(pos) {
    Some(self.map[pos.0][pos.1])
  } else {
    None
  }
}

///| Set line of grid
pub fn Grid::op_set(self : Grid, idx : Int, line : Array[Char]) -> Unit {
  self.map[idx] = line
}

///| Set char in pos
pub fn Grid::set(self : Grid, pos : (Int, Int), char : Char) -> Bool {
  if self.is_inside(pos) {
    self.map[pos.0][pos.1] = char
    true
  } else {
    false
  }
}

///| Check whether input pos is inside the grid
pub fn Grid::is_inside(self : Grid, pos : (Int, Int)) -> Bool {
  let (x, y) = pos
  0 <= x && x < self.n && 0 <= y && y < self.m
}

///| parse Array[String] to a Grid
pub fn Grid::parse(t : Array[String]) -> Grid {
  let map = t.filter(fn { t => t.length() > 0 }).map(fn { a => a.to_array() })
  let n = map.length()
  let m = map[0].length()
  for i in 0..<n {
    if map[i].length() != m {
      panic()
    }
  }
  let x = { n, m, map }
  x
}

///|
pub fn Grid::iter(self : Grid) -> Iter[(Int, Int, Char)] {
  Iter::new(
    fn(callback) {
      let mut stop = false
      for i in 0..<self.n {
        for j in 0..<self.m {
          if callback((i, j, self.map[i][j])) == IterEnd {
            stop = true
            break
          }
        }
        if stop {
          break IterEnd
        }
      } else {
        IterContinue
      }
    },
  )
}

///|
pub fn Grid::near_pos(
  self : Grid,
  pos : (Int, Int),
  skip_outside~ : Bool = true
) -> Iter[(Int, Int)] {
  let four_dirs = [(-1, 0), (0, 1), (1, 0), (0, -1)]
  let iter = four_dirs.iter().map(fn { d => (pos.0 + d.0, pos.1 + d.1) })
  if skip_outside {
    iter.filter(fn { p => self.is_inside(p) })
  } else {
    iter
  }
}
