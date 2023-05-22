Chrome:
    vim.SetWin("Chrome", "", "Chrome.exe")
    vim.SetMode("normal", "Chrome")
    vim.Map("<la-->", "<Chrome_Prev_Tab>", "Chrome")
    vim.Map("<la-=>", "<Chrome_Next_Tab>", "Chrome")
    ; vim.Map("<la-3>", "<Chrome_Select3>", "Chrome")
    ; vim.Map("<la-4>", "<Chrome_Select4>", "Chrome")
    ; vim.Map("<la-5>", "<Chrome_Select5>", "Chrome")
    ; vim.Map("<la-6>", "<Chrome_Select6>", "Chrome")
    ; vim.Map("<la-7>", "<Chrome_Select7>", "Chrome")
    ; vim.Map("<la-8>", "<Chrome_Select8>", "Chrome")
    ; vim.Map("<la-9>", "<Chrome_Select9>", "Chrome")
return

<Chrome_Next_Tab>:
    send ^{Tab}
return

<Chrome_Prev_Tab>:
    send ^+{Tab}
return

<Chrome_Select1>:
    send ^1
return

<Chrome_Select2>:
    send ^2
return

<Chrome_Select3>:
    send ^3
return

<Chrome_Select4>:
    send ^4
return

<Chrome_Select5>:
    send ^5
return

<Chrome_Select6>:
    send ^6
return

<Chrome_Select7>:
    send ^7
return

<Chrome_Select8>:
    send ^8
return

<Chrome_Select9>:
    send ^9
return
