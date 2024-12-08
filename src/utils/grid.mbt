///| Grid abstraction
pub(readonly) struct Grid {
  n : Int
  m : Int
  map : Array[Array[Char]]
} derive(Eq)

///|
impl Show for Grid with output(self, logger) {
  logger.write_string(self.to_string())
}

///|
impl Show for Grid with to_string(self) {
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

///|
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
  { n, m, map }
}
