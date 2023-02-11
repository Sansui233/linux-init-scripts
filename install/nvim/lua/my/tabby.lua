local M = {}

local function filterWin(win)
	local buf = win.buf and win.buf().id or win
	local ft = vim.api.nvim_buf_get_option(buf, 'ft')
	return not vim.tbl_contains(require('one.config').config.ignore.fileTypesForSomePlugs, ft)
end

local function renderWin(win)
	local hl, pre
	local preSym = '▌' -- '▋', '▌', '▍', '▎' '▏'

	if win.is_current() then
		hl = 'TabLineWinCur'
		pre = { preSym .. ' ', hl = 'TabLineWinSepCur' }
	else
		hl = 'TabLineWin'
		pre = { preSym .. ' ', hl = 'TabLineWinSep' }
	end

	local buf = win.buf().id
	local isModified = vim.api.nvim_buf_get_option(buf, 'modified')
	local icon = win.file_icon()
	if icon then
		icon = icon .. ' '
	else
		icon = ''
	end

	return { --
		pre,
		icon,
		win.buf_name(),
		{
			isModified and '* ' or '  ',
			hl = win.is_current() and 'TabLineBufCurModified' or 'TabLineBufModified',
		},
		hl = hl,
	}
end

local function renderTab(tab)
	local list

	local wins = tab.wins().wins
	wins = vim.tbl_filter(filterWin, wins)
	local winSum = require('one.util').superNum(#wins)
	local tabname = tab.name()
	if string.sub(tabname, -4, -1) == '[1+]' then
		tabname = string.sub(tabname, 1, -5)
	end
	if string.len(tab.name()) > 16 then
		tabname = string.format("%s...", string.sub(tab.name(), 1, 8))
	end

	if tab.is_current() then
		local sepHL = 'TabLineTabSepCur'
		list = {
			{ '', hl = 'TabLineTabSepCur' },
			string.format(' %s%s ', tabname, winSum),
			tab.close_btn(''),
			{ '', hl = 'TabLineTabSepCur' },
			hl = 'TabLineTabCur',
		}
	else
		list = { string.format('  %s%s ', tabname, winSum), tab.close_btn(''), ' ', hl = 'TabLineTab' }
	end

	return list
end

M.config = function()
	-- Always show
	vim.o.showtabline = 2

	local lines = function(line)
		local sections = {
			line.wins_in_tab(line.api.get_current_tab(), filterWin).foreach(renderWin),
			line.spacer(),
			line.tabs().foreach(renderTab),
			hl = 'TabLineBG',
		}

		return sections
	end

	require('tabby.tabline').set(lines)
end

return M
