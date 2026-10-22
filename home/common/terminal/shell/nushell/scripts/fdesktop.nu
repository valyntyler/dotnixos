# TODO: make this nicer

def symdig [app: string] {
  def sym-path []: string -> string {
    ^whereis $in
    | split row ' '
    | last
  }

  def recurse []: string -> string {
    let path = $in
    let type = $path | path type

    if $type == symlink {
      readlink $path | recurse
    } else {
      $path
    }
  }

  $app | sym-path | recurse
}

def fdesktop [
  app: string
] {
  symdig $app
  | path dirname
  | path join ../share/applications
  | path expand
  | ls $in
  | get name
  | path basename
  | to text
}
