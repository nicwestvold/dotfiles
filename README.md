# dotfiles

A compilation of dotfiles - and dev bits - that have been and are in use.

## git

When working with a bare repository (git worktree), it is necessary to run this command in order for `git fetch` to work properly.

```bash
git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
```

reference taken from [this article](https://morgan.cugerone.com/blog/workarounds-to-git-worktree-using-bare-repository-and-cannot-fetch-remote-branches/).
