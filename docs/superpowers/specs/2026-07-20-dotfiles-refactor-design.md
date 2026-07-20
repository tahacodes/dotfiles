# Dotfiles Repo Refactor — Design

Date: 2026-07-20
Status: approved approach A (single data-driven role, symlinks)

## Goals

- Less boilerplate: collapse 6 near-identical copy roles into one data-driven role.
- Room to grow: keep Ansible; future concerns (homebrew, macOS defaults, more machines) become sibling roles.
- Kill drift as side effect: symlinks instead of copies, so live edits in `$HOME` show up in `git diff` immediately.

## Non-goals

- No homebrew/macOS-defaults roles now (YAGNI — add when needed).
- No management of private SSH host files (`~/.ssh/config.d/*` besides `generic`).

## Repo location

Repo lives at `~/dotfiles` (moved out of `~/Playground`). Symlinks point at
`{{ role_path }}/files/...`, so clone path may differ per machine; rerun the
playbook after moving the clone.

## Layout

```
~/dotfiles/
  ansible.cfg
  inventory/all.yml
  site.yml
  README.md
  roles/
    dotfiles/
      defaults/main.yml     # dotfiles_links: list of {src, dest}
      files/
        zsh/.zshrc
        git/.gitconfig
        vim/.vimrc
        tmux/.tmux.conf
        ghostty/config.ghostty
        ssh/config
        ssh/config.d/generic
      tasks/main.yml
```

## Role behavior

1. Ensure parent directories exist:
   - `~/.config/ghostty` (0755)
   - `~/.ssh` (0700 — fixes current 0755, which OpenSSH dislikes)
   - `~/.ssh/config.d` (0700)
2. Symlink loop over `dotfiles_links`:
   `ansible.builtin.file: state=link, force=true, src={{ role_path }}/files/<src>, dest=<dest>`
   `force=true` replaces existing real files (repo content already synced with live, so no data loss).
3. Darwin-only: remove `~/Library/Application Support/com.mitchellh.ghostty` (kept from old ghostty role).

SSH links are file-level only (`config`, `config.d/generic`) — never symlink the
`config.d` directory, since it holds private per-host files not tracked in git.

## Deletions

- `roles/{ghostty,git,ssh,tmux,vim,zsh}` (replaced by `roles/dotfiles`)
- Empty `.ansible/` skeleton dirs
- Old per-role tags (single `dotfiles` tag suffices at this size)

## README fixes

- Run command: `ansible-playbook site.yml` (README currently says `install.yml`, which does not exist).
- Note: rerun playbook if the clone moves.

## Verification

- `ansible-playbook site.yml` completes without failure.
- `ls -la ~/.zshrc ~/.gitconfig ~/.vimrc ~/.tmux.conf ~/.config/ghostty/config.ghostty ~/.ssh/config ~/.ssh/config.d/generic` all show links into `~/dotfiles/roles/dotfiles/files/`.
- `zsh -ic true` exits 0; `ssh -G localhost` parses config without error.
- Private files in `~/.ssh/config.d/` still present and untouched.
