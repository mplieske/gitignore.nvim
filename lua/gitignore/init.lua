local augroup = vim.api.nvim_create_augroup("GitIgnore", { clear = true })

local function create_buffer()
    local buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_buf_set_name(buf, "*gitignore*")
    vim.api.nvim_set_option_value("filetype", "lua", { buf = buf })
end

local function main()
    print("Hello from gitignore.nvim!")
    local buffer = create_buffer()
    vim.api.nvim_buf_set_lines(buffer, 0, -1, true, { "Welcome to gitignore.nvim!", "" })
    vim.api.nvim_win_set_buf(0, buffer)
    vim.api.nvim_win_set_cursor(0, { vim.api.nvim_buf_line_count(buffer), 0 })
    vim.api.nvim_open_win(buffer, true, {
        relative="win",
        width=100,
        height=10,
        border="single",
        win=1001,
        row=20,
        col=20,
        zindex=10001
    })
end

local function setup()
    vim.api.nvim_create_autocmd("VimEnter", { group = augroup, desc = "Test 123", once = true, callback = main })
end

return { setup = setup }

