-- From https://github.com/gaboolic/rime-frost/blob/master/lua/is_in_user_dict.lua
local utf8 = require 'utf8'

local function add_comments(input, env)
    for cand in input:iter() do
        if cand.type == "phrase" and utf8.len(cand.text) > 1 then
            cand.comment = cand.comment .. '˚'
        end
        if cand.type == "sentence" then
            cand.comment = cand.comment .. '∞'
        end
        yield(cand)
    end
end

return add_comments
