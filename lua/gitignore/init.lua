local augroup = vim.api.nvim_create_augroup("GitIgnore", { clear = true })

local function create_buffer()
    local buffer = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_buf_set_name(buffer, "*gitignore*")
    vim.api.nvim_set_option_value("filetype", "lua", { buf = buffer })
    return buffer
end

local function main()
    local buffer = create_buffer()

    local width = 200
    local height = 20
    local column = 10
    local row = 10

    local windows = vim.api.nvim_list_uis()
    if #windows > 0 then
        width = math.floor(windows[1].width * 0.8)
        height = math.floor(windows[1].height * 0.8)
        column = math.floor((windows[1].width - width) / 2)
        row = math.floor((windows[1].height - height) / 2)
    end

    vim.api.nvim_buf_set_lines(buffer, 0, -1, true, { "Welcome to gitignore.nvim!", "" })
    vim.api.nvim_open_win(buffer, true, {
        relative="win",
        width=width,
        height=height,
        border="single",
        row=row,
        col=column,
        zindex=10001
    })
end

local function setup()
    vim.api.nvim_create_autocmd("VimEnter", { group = augroup, desc = "Test 123", once = true, callback = main })
end

return { setup = setup }

