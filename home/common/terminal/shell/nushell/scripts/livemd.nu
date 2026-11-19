#!/usr/bin/env nu

def is-markdown [] {
  return (($in | path parse | get extension) == "md")
}

def compile [file: string] {
  pandoc $file -o $"($file | path parse | get stem).pdf"
}

def livemd [file: string] {
  if ($file | path exists) and ($file | is-markdown) {
    compile $file
    watch $file | each {|| compile $file }
    return
  }
}
