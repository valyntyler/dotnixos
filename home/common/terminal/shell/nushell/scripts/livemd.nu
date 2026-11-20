#!/usr/bin/env nu

def is-markdown [] {
  return (($in | path parse | get extension) == "md")
}

def compile [file: string] {
  pandoc $file -o $"($file | path parse | get stem).pdf"
}

def livemd [file: string] {
  if ($file | path exists) {
    if ($file | is-markdown) {
      compile $file
      watch $file | each {|| compile $file }
      return
    } else {
      let span = (metadata $file).span;
      error make {
        msg: "incorrect file type",
        label: {
          text: "input is not a markdown file.",
          span: $span
        }
      }
    }
  } else {
    let span = (metadata $file).span;
    error make {
      msg: "path does not exist",
      label: {
        text: "this path does not exist.",
        span: $span
      }
    }
  }
}
