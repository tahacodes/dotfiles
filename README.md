Much wow. such dotfiles.

How to run:

```bash
ansible-playbook site.yml
```

Dotfiles are symlinked from `roles/dotfiles/files/` into `$HOME`, so live
edits show up in `git diff`. If you move this clone, rerun the playbook to
refresh the links.

Add a dotfile: drop the file under `roles/dotfiles/files/` and add one entry
to `dotfiles_links` in `roles/dotfiles/defaults/main.yml`.
