{
  programs.zellij.enable = true;
  xdg.configFile."zellij/layouts/default.kdl".text = ''
    layout {
        default_tab_template {
            pane size=1 borderless=true {
                plugin location="https://github.com/dj95/zjstatus/releases/latest/download/zjstatus.wasm" {
                    color_bg0 "#282828" //dark0
                    color_bg1 "#3c3836" //dark1
                    color_bg2 "#504945" //dark2
                    color_bg3 "#665c54" //dark3
                    color_bg4 "#7c6f64" //dark4
                    color_fg0 "#fbf1c7" //light0
                    color_fg1 "#ebdbb2" //light1
                    color_fg2 "#d5c4a1" //light2
                    color_fg3 "#bdae93" //light3
                    color_fg4 "#a89984" //light4

                    format_left   "{mode}"
                    format_center "{tabs}"
                    format_right  "{swap_layout} #[fg=$bg2]{session} 󰙀 "
                    format_space  ""

                    border_enabled  "false"
                    border_char     "─"
                    border_format   "#[fg=#6c7086]{char}"
                    border_position "top"

                    mode_normal        "#[fg=$bg4] NORMAL"
                    mode_locked        "#[fg=$bg4] LOCKED"
                    mode_resize        "#[fg=$bg4]󰆞 RESIZE"
                    mode_tmux          "#[fg=$bg4] TMUX"
                    mode_move          "#[fg=$bg4]󰆾 MOVE"
                    mode_pane          "#[fg=$bg4] PANE"
                    mode_tab           "#[fg=$bg4]󰓩 TAB"
                    mode_session       "#[fg=$bg4] SESSION"
                    mode_scroll        "#[fg=$bg4]󰩉 SCROLL"

                    mode_enter_search  "ent-search"
                    mode_search        "searcharch"
                    mode_rename_tab    "rename-tab"
                    mode_rename_pane   "rename-pane"
                    mode_prompt        "prompt"

                    tab_normal   "#[fg=$bg4]  "
                    tab_active   "#[fg=$fg4,bold]  "

                    command_git_branch_command     "git rev-parse --abbrev-ref head"
                    command_git_branch_format      "#[fg=blue] {stdout} "
                    command_git_branch_interval    "10"
                    command_git_branch_rendermode  "static"

                    datetime        "#[fg=$bg2,bold] {format} "
                    datetime_format "%a, %d %b %y %h:%m"
                    datetime_timezone "europe/bucharest"
                }
            }
            children
        }
    }
  '';

  xdg.configFile."zellij/config.kdl".text = ''
    // Generated from https://zellij.dev/old-documentation/keybindings-examples
    // using zellij convert-theme.
    // https://zellij.dev/documentation/migrating-yaml-layouts.html
    keybinds clear-defaults=true {
      shared {
        bind "Down" { ScrollDown; }
        bind "Up" { ScrollUp; }
      }
      shared_except "locked" {
        bind "Esc" { Write 2; SwitchToMode "locked"; }
        bind "Ctrl a" { SwitchToMode "locked"; }
      }
      shared_among "locked" "pane" {
        // Navigation
        bind "Alt h" { MoveFocusOrTab "Left"; }
        bind "Alt l" { MoveFocusOrTab "Right"; }
        bind "Alt j" { MoveFocus "Down"; }
        bind "Alt k" { MoveFocus "Up"; }
      }
      normal {
        // Modes
        bind "p" { SwitchToMode "pane"; }
        bind "r" { SwitchToMode "resize"; }
        bind "t" { SwitchToMode "tab"; }
        bind "s" { SwitchToMode "scroll"; }
        bind "o" { SwitchToMode "session"; }
        bind "h" { SwitchToMode "move"; }

        bind "q" { Quit; }
        bind "d" { Detach; }
        bind "b" { Write 2; SwitchToMode "locked"; }
        bind "Space" "Enter" { SwitchToMode "locked"; }
        bind "f" { ToggleFloatingPanes; SwitchToMode "locked"; }
        bind "Alt n" { NewPane; SwitchToMode "locked"; }
        bind "n" { NewTab; SwitchToMode "locked"; }
        bind "[" "Alt [" { FocusPreviousPane; }
        bind "]" "Alt [" { FocusNextPane; }
        bind "-" { NewPane "Down"; SwitchToMode "locked"; }
        bind "=" { Resize "Increase"; }
        bind "+" { Resize "Increase"; }
        bind "-" { Resize "Decrease"; }
        bind "Left" { Resize "Left"; }
        bind "Down" { Resize "Down"; }
        bind "Up" { Resize "Up"; }
        bind "Right" { Resize "Right"; }
        bind "c" { SwitchToMode "RenamePane"; PaneNameInput 0; }
        bind "C" { SwitchToMode "RenameTab"; TabNameInput 0; }
        bind "e" { EditScrollback; SwitchToMode "locked"; }
      }
      locked {
        bind "Ctrl a" { SwitchToMode "normal"; }

        // Select Tab
        bind "Alt 1" { GoToTab 1; }
        bind "Alt 2" { GoToTab 2; }
        bind "Alt 3" { GoToTab 3; }
        bind "Alt 4" { GoToTab 4; }
        bind "Alt 5" { GoToTab 5; }
        bind "Alt 6" { GoToTab 6; }
        bind "Alt 7" { GoToTab 7; }
        bind "Alt 8" { GoToTab 8; }
        bind "Alt 9" { GoToTab 9; }
        bind "Alt 0" { GoToTab 10; }
      }
      pane {
        bind "Ctrl p" { SwitchToMode "normal"; }
        bind "Ctrl r" "Enter" "Space" { SwitchToMode "locked"; }
        bind "Ctrl s" { SwitchToMode "scroll"; }
        bind "Alt h" "Left" { MoveFocus "Left"; }
        bind "Alt l" "Right" { MoveFocus "Right"; }
        bind "Alt j" "Down" { MoveFocus "Down"; }
        bind "Alt k" "Up" { MoveFocus "Up"; }
        bind "p" { SwitchFocus; }
        bind "n" "Alt n" { NewPane; SwitchToMode "locked"; }
        bind "N" { NewPane; }
        bind "d" { NewPane "Down"; SwitchToMode "locked"; }
        bind "r" { NewPane "Right"; SwitchToMode "locked"; }
        bind "z" { TogglePaneFrames; SwitchToMode "locked"; }
        bind "Z" { TogglePaneFrames; }
        bind "D" { NewPane "Down"; }
        bind "R" { NewPane "Right"; }
        bind "x" { CloseFocus; SwitchToMode "locked"; }
        bind "X" { CloseFocus; }
        bind "f" { ToggleFocusFullscreen; SwitchToMode "locked"; }
        bind "F" { ToggleFocusFullscreen; }
        bind "Alt [" { FocusPreviousPane; }
        bind "Alt ]" { FocusNextPane; }
        bind "f" { ToggleFocusFullscreen; SwitchToMode "normal"; }
        bind "z" { TogglePaneFrames; SwitchToMode "normal"; }
        bind "w" { ToggleFloatingPanes; SwitchToMode "normal"; }
        bind "e" { TogglePaneEmbedOrFloating; SwitchToMode "normal"; }
        bind "c" { SwitchToMode "RenamePane"; PaneNameInput 0; }
      }
      tab {
        bind "Ctrl p" { SwitchToMode "pane"; }
        bind "Enter" "Space" { SwitchToMode "locked"; }
        bind "Ctrl s" { SwitchToMode "scroll"; }
        bind "r" { SwitchToMode "RenameTab"; TabNameInput 0; }
        bind "Alt [" { FocusPreviousPane; }
        bind "Alt ]" { FocusNextPane; }
        bind "h" { GoToPreviousTab; }
        bind "l" { GoToNextTab; }
        bind "j" { GoToNextTab; }
        bind "k" { GoToPreviousTab; }
        bind "n" { NewTab; SwitchToMode "locked"; }
        bind "x" { CloseTab; SwitchToMode "locked"; }
        bind "Alt h" { MoveFocus "Left"; }
        bind "Alt l" { MoveFocus "Right"; }
        bind "Alt j" { MoveFocus "Down"; }
        bind "Alt k" { MoveFocus "Up"; }
      }
      resize {
        bind "Ctrl p" { SwitchToMode "pane"; }
        bind "Ctrl r" "Enter" "Space" { SwitchToMode "locked"; }
        bind "Ctrl s" { SwitchToMode "scroll"; }
        bind "h" "Left" { Resize "Left"; }
        bind "j" "Down" { Resize "Down"; }
        bind "k" "Up" { Resize "Up"; }
        bind "l" "Right" { Resize "Right"; }
        bind "Alt n" { NewPane; }
        bind "Alt h" "Left" { MoveFocus "Left"; }
        bind "Alt l" "Right" { MoveFocus "Right"; }
        bind "Alt j" "Down" { MoveFocus "Down"; }
        bind "Alt k" "Up" { MoveFocus "Up"; }
        bind "Alt [" { FocusPreviousPane; }
        bind "Alt ]" { FocusNextPane; }
      }
      move {
        bind "h" { MovePane "left"; }
        bind "j" { MovePane "down"; }
        bind "k" { MovePane "up"; }
        bind "l" { MovePane "right"; }
        bind "n" { MovePane; }
        bind "p" { MovePaneBackwards; }
        bind "tab" { MovePane; }
      }
      scroll {
        bind "e" { EditScrollback; SwitchToMode "locked"; }
        bind "h" { PageScrollDown; }
        bind "j" { ScrollDown; }
        bind "k" { ScrollUp; }
        bind "l" { PageScrollUp; }
        bind "g" { ScrollToTop; }
        bind "G" { ScrollToBottom; }
      }
      session {
        bind "d" { Detach; }
      }
      RenameTab {
        bind "Ctrl r" { SwitchToMode "normal"; }
        bind "Ctrl s" "Space" { SwitchToMode "locked"; }
        bind "Enter" { SwitchToMode "tab"; }
        bind "Esc" { TabNameInput 27; SwitchToMode "tab"; }
        bind "Alt n" { NewPane; }
        bind "Alt h" { MoveFocus "Left"; }
        bind "Alt l" { MoveFocus "Right"; }
        bind "Alt j" { MoveFocus "Down"; }
        bind "Alt k" { MoveFocus "Up"; }
        bind "Alt [" { FocusPreviousPane; }
        bind "Alt ]" { FocusNextPane; }
      }
      RenamePane {
        bind "Enter" "Ctrl c" "Esc" { SwitchToMode "normal"; }
        bind "Esc" { PaneNameInput 27; SwitchToMode "pane"; }
        bind "Alt n" { NewPane; }
        bind "Alt h" { MoveFocus "Left"; }
        bind "Alt l" { MoveFocus "Right"; }
        bind "Alt j" { MoveFocus "Down"; }
        bind "Alt k" { MoveFocus "Up"; }
        bind "Alt [" { FocusPreviousPane; }
        bind "Alt ]" { FocusNextPane; }
        bind "Alt =" { Resize "Increase"; }
        bind "Alt +" { Resize "Increase"; }
        bind "Alt -" { Resize "Decrease"; }
      }
    }

    // Choose what to do when zellij receives SIGTERM, SIGINT, SIGQUIT or SIGHUP
    // eg. when terminal window with an active zellij session is closed
    // Options:
    //   - detach (Default)
    //   - quit
    //
    // on_force_close "quit"

    // Send a request for a simplified ui (without arrow fonts) to plugins
    // Options:
    //   - true
    //   - false (Default)
    //
    // simplified_ui true

    // Choose the path to the default shell that zellij will use for opening new panes
    // Default: $SHELL
    //
    // default_shell "fish"

    // Toggle between having pane frames around the panes
    // Options:
    //   - true (default)
    //   - false
    //
    pane_frames false

    // Whether to show tips on startup
    // Default: true
    //
    show_startup_tips false

    // Choose the theme that is specified in the themes section.
    // Default: default
    //
    theme "gruvbox-dark"

    // The name of the default layout to load on startup
    // Default: "default"
    //
    // default_layout "compact"

    // Choose the mode that zellij uses when starting up.
    // Default: normal
    //
    default_mode "locked"

    // Toggle enabling the mouse mode.
    // On certain configurations, or terminals this could
    // potentially interfere with copying text.
    // Options:
    //   - true (default)
    //   - false
    //
    mouse_mode true

    // Configure the scroll back buffer size
    // This is the number of lines zellij stores for each pane in the scroll back
    // buffer. Excess number of lines are discarded in a FIFO fashion.
    // Valid values: positive integers
    // Default value: 10000
    //
    // scroll_buffer_size 10000

    // Provide a command to execute when copying text. The text will be piped to
    // the stdin of the program to perform the copy. This can be used with
    // terminal emulators which do not support the OSC 52 ANSI control sequence
    // that will be used by default if this option is not set.
    // Examples:
    //
    // copy_command "xclip -selection clipboard" // x11
    // copy_command "wl-copy"                    // wayland
    // copy_command "pbcopy"                     // osx

    // Choose the destination for copied text
    // Allows using the primary selection buffer (on x11/wayland) instead of the system clipboard.
    // Does not apply when using copy_command.
    // Options:
    //   - system (default)
    //   - primary
    //
    // copy_clipboard "primary"

    // Enable or disable automatic copy (and clear) of selection when releasing mouse
    // Default: true
    //
    // copy_on_select false

    // Path to the default editor to use to edit pane scrollbuffer
    // Default: $EDITOR or $VISUAL
    //
    // scrollback_editor "/usr/bin/vim"

    // When attaching to an existing session with other users,
    // should the session be mirrored (true)
    // or should each user have their own cursor (false)
    // Default: false
    //
    // mirror_session true

    // The folder in which Zellij will look for layouts
    //
    // layout_dir /path/to/my/layout_dir

    // The folder in which Zellij will look for themes
    //
    // theme_dir "/path/to/my/theme_dir"
  '';
}
