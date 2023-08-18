# What it is
Simple plugin to manage easily the vim builtin sessions feature

---

# Using sessionmanager

Change `g:sessions_location` global variable to the place where
you want to put the sessions (default to `$HOME .. '/vimfiles/sessions'`)

To create a session use:

`CreateSessioin()`

To delete a session use:

`DeleteSession()`

To list the sessions use:

`ListAllSessions()`

To restore a session use:

`RestoreSession()`

# Install

## Vundle

Put `Plugin 'lincolngondin/vim-session-manager'` in your vimrc 
 
