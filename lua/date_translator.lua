-- https://github.com/LufsX/rime/blob/master/lua/date_translator.lua

local function translator(input, seg)
   if (input == "date") then
      yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), ""))
      yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), ""))
      yield(Candidate("date", seg.start, seg._end, os.date("%Y%m%d"), ""))
   end
   if (input == "time") then
      yield(Candidate("time", seg.start, seg._end, os.date("%H:%M"), ""))
      yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), ""))
   end
   if (input == "timestamp") then
      yield(Candidate("time", seg.start, seg._end, os.time(), ""))
   end
   if (input == "datetime") then
      yield(Candidate("datetime", seg.start, seg._end, os.date("%Y-%m-%d %H:%M:%S"), ""))
      yield(Candidate("datetime", seg.start, seg._end, os.date("%Y-%m-%dT%H:%M:%S+08:00"), ""))
   end
   if (input == "week") then
      local weakTab = {'日', '一', '二', '三', '四', '五', '六'}
      yield(Candidate("week", seg.start, seg._end, "周"..weakTab[tonumber(os.date("%w")+1)], ""))
      yield(Candidate("week", seg.start, seg._end, "星期"..weakTab[tonumber(os.date("%w")+1)], ""))
      yield(Candidate("week", seg.start, seg._end, os.date("%A"), ""))
      yield(Candidate("week", seg.start, seg._end, os.date("%a"), ""))
      yield(Candidate("week", seg.start, seg._end, os.date("W%W"), ""))
   end
   if (input == "month") then
      yield(Candidate("month", seg.start, seg._end, os.date("%B"), ""))
      yield(Candidate("month", seg.start, seg._end, os.date("%b"), ""))
   end
end

return translator
