vim9script
# Vim global plugin for manage more easily the session vim function 
# Last Change: 2023 Aug 17
# Maintainer: Lincoln Gondin <github.com/lincolngondin>
# License: This file is placed in the public domain.


if exists("g:loaded_sessionmanager")
    finish
endif
g:loaded_sessionmanager = 1

if !exists("g:sessions_location")
    g:sessions_location = $HOME .. '/vimfiles/sessions/'
endif

def g:CreateSession()
    var nome = input("Nome da sessão: ")
    execute $"mksession {g:sessions_location}/{nome}.vim"
enddef

def g:RestoreSession()
    var nome = input("Restore session: ")
    printf("%s", nome)
    if len(nome) == 0
        return
    endif
    try
        execute $"source {g:sessions_location}{nome}.vim"
    catch /E484:/
        echon ' '
        echo "No such session!"
    endtry
enddef

def g:ListAllSessions()
    var files = readdir($"{g:sessions_location}")
    var leh = len(files)
    for counter in range(leh)
        echo $"{counter + 1}: {files[counter]}"
    endfor
enddef

def g:DeleteSession()
    var files = readdir($"{g:sessions_location}")
    var formatedFiles = []
    var counter = 0
    for file in files
        counter += 1
        formatedFiles->add($"{counter}. {file}")
    endfor
    var escolha = inputlist(formatedFiles)
    try
        delete($"{g:sessions_location}{files[escolha - 1]}")
        echo $"\nDeletado {files[escolha - 1]}!"
    catch
        echo "\nFile not found!"
    endtry
enddef

command! CreateSession :call g:CreateSession() 
command! ListAllSessions :call g:ListAllSessions() 
command! RestoreSession :call g:RestoreSession() 
command! DeleteSession :call g:DeleteSession() 
