# Environment Setup

This describes general setup when setting up git in a new environment. 

## Core

Set auto crlf and safe crlf to true to make working on Windows easier. LF/CRLF problems are a huge pain, and the less you have to deal with it, the better. 

```
> git config core.autocrlf true
> git config core.safecrlf true
```

Set the editor to vim. This is the default, but this makes it explicit to prevent repos from overriding it.

```
> git config core.editor vim
```

## Setup diff tool

I don't know about Linux, but there's no good diff tool built into Windows. In fact, it will default to Notepad, and you really don't want to be doing diffs in Notepad. Go install kdiff3 and then add it to your git config. I'm not sure of the exact commands to run, but add these lines directly to your git config.

```
[diff]
	tool = kdiff3
	guitool = kdiff3
[difftool "kdiff3"]
	path = c:/Program Files/KDiff3/kdiff3.exe
```
