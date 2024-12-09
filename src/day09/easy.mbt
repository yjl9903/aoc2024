///|
pub fn solve_day09_easy(input : Input) -> Output {
  let disk = generate_disk(input)
  let mut pos = 0
  let mut i = disk.length() - 1
  while i > pos {
    if disk[i] != None {
      while pos < i && disk[pos] != None {
        pos += 1
      }
      if pos < i {
        disk[pos] = disk[i]
        disk[i] = None
      }
    }
    i -= 1
  }
  checksum(disk)
}

///|
fn generate_disk(input : Input) -> Array[Int?] {
  let disk = []
  let mut id = 0
  let mut block = true
  for c in input {
    if block {
      for j in 0..<c {
        disk.push(Some(id))
      }
      id += 1
    } else {
      for j in 0..<c {
        disk.push(None)
      }
    }
    block = not(block)
  }
  disk
}

///|
fn checksum(disk : Array[Int?]) -> Output {
  let mut ans = 0L
  for i, c in disk.iter2() {
    match c {
      Some(id) => ans += i.to_int64() * id.to_int64()
      None => ()
    }
  }
  ans
}
