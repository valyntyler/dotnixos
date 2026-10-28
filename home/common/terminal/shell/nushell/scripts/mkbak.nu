def mkbak [path: string] {
  cp $path $"($path).bak"
}
