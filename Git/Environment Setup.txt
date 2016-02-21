# Aliases

# lol - Pretty log print
> git config [--global] alias.lol log --oneline --graph --decorate

# Integrate -- Does a non-fastforward merge, only if a fast forward is possible
# Creates a pocket of related commits while maintaining a linear history
# * Merge commit
# |\ 
# | * Commit 2
# | * Commit 1
# |/
# *
> git config [--global] alias.integrate '!test \"$(git merge-base HEAD \"$1\")\" = \"$(git rev-parse HEAD)\" && git merge --no-ff --edit $1 || echo >&2 \"Not up-to-date. refusing to merge, rebase first!\"' 

# Update - Updates a branch from a remote, only if it can fast forward
# Helpful for updating master and catching any divergence 
> git config [--global] alias.update "! git fetch && git merge --ff-only"

# View - opens gitk with all local branches visible
# Useful when trying to understand the relative state of several different local branches
> git config [--global] alias.view !gitk --branches=* &

------------------------------

# Core
> git config core.autocrlf true
> git config core.safecrlf true
> git config core.editor vim

------------------------------

# Setup diff tool
Install kdiff3

# Not sure of exact commands, add to git config
[diff]
	tool = kdiff3
	guitool = kdiff3
[difftool "kdiff3"]
	path = c:/Program Files/KDiff3/kdiff3.exe