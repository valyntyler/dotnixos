def ziphere [] {
  let output = $"(pwd | path basename).zip"
  let input = ls -a | each {|| $in | get name | path expand | $"'($in)'"} | str join ' '

  $"ouch compress --yes ($input) '($output)'" | bash
}
