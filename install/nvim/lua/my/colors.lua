local M = {}
M.colors = {
	black = '#15191f',
	grey1 = '#23232a',
	grey2 = '#2a2a37',
	grey3 = '#34373B',
	grey4 = '#484D52',
	grey = '#6C6F7F',
	white = '#abb2bf',
	red = '#ef596f',
	orange = '#e76F00',
	yellow = '#ffc15A',
	green = '#73d896',
	cyan = '#ACCBE1',
	blue = '#689AFD',
	purple = '#c678dd',
	darkGreen = '#233a0c',
	darkBlue = '#1f2537',
	darkCyan = '#1f3850',
	darkRed = '#4F1919',
	darkYellow = '#513130',
	darkOrange = '#572B00',
	darkPurple = '#482245',
	scrollbarBG = '#2E2841',
	cursorLine = '#1f2537',
}
M.highlights = {
	Visual = { bg = "#34373b", fg = "#ffffff" },
	Include = { fg = '#CF77BF' },
	Type = { fg = '#d78F38' },
	Boolean = { fg = '#6395fa' },
	Identifier = { fg = '#f64686' },
	Function = { fg = '#79c0ff' },
}
M.rainbow = {
	colors = {
		"#ef596f",
		"#e76f00",
		"#ffc15a",
		'#73d896',
		'#ACCBE1',
		'#689AFD',
		'#d55fde',
	}
}
return M
