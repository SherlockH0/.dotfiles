local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gears = require("gears")
local awful = require("awful")
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font = "FantasqueSansM Nerd Font 10"

theme.bg_normal = "#1d2021"
theme.bg_focus = "#282828"
theme.bg_urgent = "#e78a4e"
theme.bg_minimize = "#504945"
theme.bg_systray = theme.bg_normal

theme.fg_normal = "#ddc7a1"
theme.fg_focus = "#a9b665"
theme.fg_urgent = "#ddc7a1"
theme.fg_minimize = "#ddc7a1"

theme.useless_gap = dpi(3)
theme.border_width = dpi(1)
theme.border_normal = "#3c3836"
theme.border_focus = "#504945"
theme.border_marked = "#91231c"

theme.snap_bg = "#d4be9830"
theme.snap_border_width = 2
theme.snap_shape = function(cr, w, h)
	gears.shape.rounded_rect(cr, w, h, 1)
end

theme.wallpaper = function()
	awful.spawn.with_shell("nitrogen --restore &")
end

-- Default layout icons
theme.layout_fairh = "/usr/share/awesome/themes/default/layouts/fairhw.png"
theme.layout_fairv = "/usr/share/awesome/themes/default/layouts/fairvw.png"
theme.layout_floating = "/usr/share/awesome/themes/default/layouts/floatingw.png"
theme.layout_magnifier = "/usr/share/awesome/themes/default/layouts/magnifierw.png"
theme.layout_max = "/usr/share/awesome/themes/default/layouts/maxw.png"
theme.layout_fullscreen = "/usr/share/awesome/themes/default/layouts/fullscreenw.png"
theme.layout_tilebottom = "/usr/share/awesome/themes/default/layouts/tilebottomw.png"
theme.layout_tileleft = "/usr/share/awesome/themes/default/layouts/tileleftw.png"
theme.layout_tile = "/usr/share/awesome/themes/default/layouts/tilew.png"
theme.layout_tiletop = "/usr/share/awesome/themes/default/layouts/tiletopw.png"
theme.layout_spiral = "/usr/share/awesome/themes/default/layouts/spiralw.png"
theme.layout_dwindle = "/usr/share/awesome/themes/default/layouts/dwindlew.png"
theme.layout_cornernw = "/usr/share/awesome/themes/default/layouts/cornernw.png"
theme.layout_cornerne = "/usr/share/awesome/themes/default/layouts/cornerne.png"
theme.layout_cornersw = "/usr/share/awesome/themes/default/layouts/cornersw.png"
theme.layout_cornerse = "/usr/share/awesome/themes/default/layouts/cornerse.png"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- theme.notification_position = "center_center"

theme.menu_height = 30
theme.menu_width = 180
theme.menu_bg_normal = "#141617"
theme.menu_bg_focus = "#282828"
theme.menu_fg_normal = "#d4be98"
theme.menu_fg_focus = "#a9b665"
theme.menu_border_color = "#504945"
theme.menu_font = "FantasqueSansM Nerd Font 12"
theme.menu_submenu = " "
theme.menu_submenu_icon = nil

theme.icon_theme = "Papirus"

theme.border_radius = 30

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
