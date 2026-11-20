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
        msg: "Incorrect file type",
        label: {
          text: "Input is not a markdown file",
          span: $span
        }
      }
    }
  } else {
    let span = (metadata $file).span;
    error make {
      msg: "Path does not exist",
      label: {
        text: "This path does not exist",
        span: $span
      }
    }
  }
}
