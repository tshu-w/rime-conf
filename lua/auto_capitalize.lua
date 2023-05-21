local function filter(input, env)
   for cand in input:iter() do
      local text = cand.text
      local commit = env.engine.context.input
      if (string.find(text, "^%l%l.*") and string.find(commit, "^%u%u.*")) then
         yield(Candidate("UPPERCASE", 0, string.len(commit), string.upper(text), string.upper(cand.comment)))
      elseif (string.find(text, "^%l+$") and string.find(commit, "^%u+")) then
         local suffix = string.sub(text, string.len(commit) + 1)
         yield(Candidate("Capitalize", 0, string.len(commit), commit .. suffix, cand.comment))
      else
         yield(cand)
      end
   end
end

return filter
