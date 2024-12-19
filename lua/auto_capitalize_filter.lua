-- From https://github.com/WithdewHua/rime-configuration/blob/main/Rime/Common/lua/autocap_filter.lua

local function auto_capitalize(input, env)
   for cand in input:iter() do
      local text = cand.text
      local context_input = env.engine.context.input
      if context_input:find("^%u+") and text:find("^%l+") then
         if context_input:find("^%u%u.*") then
            text = text:upper()
         else
            text = text:sub(1, 1):upper() .. text:sub(2)
         end
         yield(Candidate(cand.type, 0, #context_input, text, cand.comment))
      else
         yield(cand)
      end
   end
end

return auto_capitalize
