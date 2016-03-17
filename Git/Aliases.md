# Git Aliases

This section defines some helpful aliases I've found while working with Git. The commands in this section are meant for execution on Windows machines in Powershell. Batch and native bash will probably require slightly different escaping. 

## Pretty log print
Alias for a relatively-nice looking command line log format. Prints out the commit graph next to the main line for each commit, and prints out branches next to the commit. 

```
> git config [--global] alias.lol log --oneline --graph --decorate

```

## Pocket-Merge 
Performs what I'm affectionately calling a "pocket-merge" -- a merge which will contain a pocket of related commits while maintaining a linear history. More technically, this performs a non-fastforward merge, but only if a fast-forward merge is possible. 

This will cause history to look like the below. History is still linear because commits only occur on one side of the merge. 

    * Future commits
    * Merge commit
    |\ 
    | * Commit 2
    | * Commit 1
    |/
    * Other 
    * Commits

The alias is:
```
> git config [--global] alias.integrate '!test \"$(git merge-base HEAD \"$1\")\" = \"$(git rev-parse HEAD)\" && git merge --no-ff --edit $1 || echo >&2 \"Not up-to-date. refusing to merge, rebase first!\"' 
```

## Update branch to upstream branch
This updates a branch from changes from its upstream branch, but only if the local branch can fast forward to the upstream branch. This is useful for updating master and catching any divergence from origin/master (in case you accidentally made commits to master).

```
> git config [--global] alias.update "! git fetch && git merge --ff-only"
```

# View all local branches in gitk
This opens gitk with all local branches visible. This is useful when trying to understand the relative state of several different local branches (without having to mess with the gitk menus).

```
> git config [--global] alias.view !gitk --branches=* &
```
