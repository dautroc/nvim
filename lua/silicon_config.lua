require('silicon').setup({
	output = string.format(
		"/Users/eh/Desktop/screenshots/SILICON_%s-%s-%s_%s-%s.png",
		os.date("%Y"),
		os.date("%m"),
		os.date("%d"),
		os.date("%H"),
		os.date("%M")
	),
	font = "JetBrainsMono Nerd Font Mono"
})
