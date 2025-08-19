
#!/bin/bash
# ~/.config/hypr/scripts/wallpapers.sh

THEMEIS=$(readlink -f ~/.config/waybar/style.css | cut -d '-' -f2)

if [ "$THEMEIS" != "dark.css" ]; then 
    SWITCHTO=""
else 
    SWITCHTO="-dark"
fi 

# ================= CONFIG =================
WALLPAPER_DIR="$HOME/.config/hypr/wallpapers/themes/images$SWITCHTO"
SYMLINK_PATH="$HOME/.config/hypr/wallpapers/wallpaper.jpg"
PREVIEW_PATH="$HOME/.config/rofi/wallpaper.jpg"

# ================= HELPER =================
print_wallpapers() {
    cd "$WALLPAPER_DIR" || exit 1
    IFS=$'\n'
    for file in $(ls -t *.jpg *.png *.gif *.jpeg 2>/dev/null); do
        full_path="$WALLPAPER_DIR/$file"
        # Format for Rofi emoji-style: name + icon
        printf '%s\0icon\x1f%s\n' "$file" "$full_path"
    done
}

set_wallpaper() {
    local selected="$1"
    [ -z "$selected" ] && exit 0
    local selected_path="$WALLPAPER_DIR/$selected"

    # Update symlink for swww
    ln -sf "$selected_path" "$WALLPAPER_DIR/link"
    ln -sf "$WALLPAPER_DIR/link" "$SYMLINK_PATH"

    # Set wallpaper
    swww img "$SYMLINK_PATH" --transition-type any --transition-duration 3

    # Optional: create preview for Rofi / wlogout
    magick "$SYMLINK_PATH" -resize 2300x1294\> -quality 85 "$PREVIEW_PATH"
    cp "$PREVIEW_PATH" "$HOME/.config/wlogout/wallpaper.jpg"
    magick "$HOME/.config/wlogout/wallpaper.jpg" -blur 0x8 "$HOME/.config/wlogout/wallpaper.jpg"
}

# ================= RUN =================
# 1) Output wallpaper list for Rofi
if [ -z "$1" ]; then
    print_wallpapers
    exit 0
fi

# 2) Handle selection
set_wallpaper "$1"
