///|
pub fn solve_day09_hard(input : Input) -> Output {
  let mut disk = input.mapi(
    fn { i, b => if i % 2 == 0 { File(b, i / 2) } else { Space(b) } },
  )
  {
    let mut i = disk.length() - 1
    while i > 0 {
      match disk[i] {
        File(sz, id) => {
          let mut pos = 0
          let mut found = false
          while pos < i {
            match disk[pos] {
              File(_) => pos += 1
              Space(space) =>
                if space >= sz {
                  found = true
                  break
                } else {
                  pos += 1
                }
            }
          }
          if pos < i && found {
            match disk[pos] {
              Space(space) => {
                // Insert disk
                disk.insert(pos, File(sz, id))
                pos += 1
                i += 1
                // Remove space
                disk[pos] = Space(space - sz)
                // Remove disk
                disk[i] = Space(sz)
              }
              File(_) => ()
            }
          }
        }
        Space(_) => ()
      }
      i -= 1
    }

    // Create new disk
    let new_disk = []
    let mut space = 0
    for file in disk {
      match file {
        File(sz, id) => {
          if space > 0 {
            new_disk.push(Space(space))
            space = 0
          }
          new_disk.push(File(sz, id))
        }
        Space(sz) => space += sz
      }
    }
    if space > 0 {
      new_disk.push(Space(space))
    }
    disk = new_disk
  }
  let mut pos = 0L
  let mut ans = 0L
  for file in disk {
    match file {
      File(sz, id) => {
        let sum = (pos + pos + sz.to_int64() - 1) * sz.to_int64() / 2
        pos += sz.to_int64()
        ans += sum * id.to_int64()
      }
      Space(sz) => pos += sz.to_int64()
    }
  }
  ans
}

///|
enum Block {
  File(Int, Int)
  Space(Int)
} derive(Show, Eq, Hash)

///|
fn Block::is_space(self : Block) -> Bool {
  match self {
    File(_) => false
    Space(_) => true
  }
}
