#!/usr/bin/luajit
--
-- pretend to run a command (print it and exit)
--

local shellquote = function (s)
	if s == '' or s:find('[^A-Za-z0-9%-=/.,:]') then
		return '\'' .. s:gsub('\'', '\'\\\'\'') .. '\''
	else
		return s
	end
end
for i = 1, #arg do
	arg[i] = shellquote(arg[i])
end
return io.stderr:write('+ ', table.concat(arg, ' '), '\n')
