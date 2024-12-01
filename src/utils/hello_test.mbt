test "hello" {
  if @utils.hello() != "Hello, world!" {
    fail!("@lib.hello() != \"Hello, world!\"")
  }
}
