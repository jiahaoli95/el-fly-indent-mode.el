# el-fly-indent-mode.el [![Melpa Status](http://melpa.milkbox.net/packages/el-fly-indent-mode-badge.svg)](http://melpa.milkbox.net/#/el-fly-indent-mode)
Indent Emacs Lisp on the fly

## Setup
Install the package from MELPA and add `(el-fly-indent-init)` in you `~/.emacs`.

## Usage
This minor mode toggles on along with elisp-mode and indents on the fly when you edit the code. No special key strokes needed.

## Demo
[![Alt text](https://img.youtube.com/vi/zrFmfFZfj-A/0.jpg)](https://www.youtube.com/watch?v=zrFmfFZfj-A)

## Notes
* The indenting command modifies match data, so if you have to use the match data to edit the buffer(for example globally replacing some string), toggle the mode off with `M-x (el-fly-indent-mode)` before you do that.
