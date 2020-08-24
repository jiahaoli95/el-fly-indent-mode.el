# el-fly-indent-mode.el [![MELPA](https://melpa.org/packages/el-fly-indent-mode-badge.svg)](https://melpa.org/#/el-fly-indent-mode)
Indent Emacs Lisp on the fly

## Setup
Install the package from MELPA and add `(add-hook 'emacs-lisp-mode-hook #'el-fly-indent-mode)` to your ~/.emacs file.

## Usage
This minor mode toggles on along with elisp-mode and indents on the fly when you edit the code. No special key strokes needed.

## Demo
[![Alt text](https://img.youtube.com/vi/zrFmfFZfj-A/0.jpg)](https://www.youtube.com/watch?v=zrFmfFZfj-A)

## Notes
* The indenting command modifies match data, so if you have to use the match data to edit the buffer(for example globally replacing some string), toggle the mode off with `M-x (el-fly-indent-mode)` before you do that.
