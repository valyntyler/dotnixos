def lmk [cmd] {
  run-external $cmd
  notify-send $cmd "Command finished executing!"
}
