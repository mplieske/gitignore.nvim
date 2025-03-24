local augroup = vim.api.nvim_create_augroup("GitIgnore", { clear = true })

local function main()
    print("Hello from gitignore.nvim!")
end

local function setup()
    vim.api.nvim_create_autocmd("VimEnter", { group = augroup, desc = "Test 123", once = true, callback = main })
end

return { setup = setup }

