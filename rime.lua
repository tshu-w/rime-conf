-- 參考 https://github.com/hchunhui/librime-lua

-- I. translators:

date_translator = require("date_translator")

-- II. filters:

-- charset_filter: 滤除含 CJK 扩展汉字的候选项
-- charset_comment_filter: 为候选项加上其所属字符集的注释
local charset = require("charset")
charset_filter = charset.filter
charset_comment_filter = charset.comment_filter

-- auto_capitalize_filter: 自动大写候选项
auto_capitalize_filter = require("auto_capitalize")

-- III. processors:

select_character_processor = require("select_character")
