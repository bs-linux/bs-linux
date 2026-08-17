hl.monitor({
    output   = "DP-1",
    mode     = "2560x1440@143.97Hz",
    position = "0x0",
    scale    = "1"
})
hl.monitor({
	output	 = "DP-2",
	mode	 = "2560x1440@170.00Hz",
	position = "0x-1440",
	scale	 = "1"
})
hl.monitor({
	output	 = "DP-3",
	mode	 = "1920x1080@119.98Hz",
	position = "-1920x0",
	scale	 = "1"
})

-- DP-1 get 1-4, DP-2 gets 5-8, DP-3 gets 9 & 10
for i = 1, 4 do
	hl.workspace_rule({ workspace = tostring(i), monitor = "DP-1", persistent = true, default = (i == 1) })
end
for i = 5, 8 do
	hl.workspace_rule({ workspace = tostring(i), monitor = "DP-2", persistent = true, default = (i == 5) })
end
for i = 9, 10 do
	hl.workspace_rule({ workspace = tostring(i), monitor = "DP-3", persistent = true, default = (i == 9) })
end
