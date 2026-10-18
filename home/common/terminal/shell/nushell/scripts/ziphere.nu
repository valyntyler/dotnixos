def ziphere [] {
  let input = ^echo ...(glob *)
  let output = $"(pwd | path basename).zip"

  $"ouch compress --yes ($input) ($output)" | bash
}
