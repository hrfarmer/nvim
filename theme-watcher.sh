THEME_FILE="$HOME/.config/nvim/.theme"
mkdir -p "$(dirname "$THEME_FILE")"

prev=$(defaults read -g AppleInterfaceStyle 2>/dev/null || echo "Light")

while true; do
  curr=$(defaults read -g AppleInterfaceStyle 2>/dev/null || echo "Light")
  if [[ "$curr" != "$prev" ]]; then
    prev="$curr"
    if [[ "$curr" == "Dark" ]]; then
      echo "dark" > "$THEME_FILE"
    else
      echo "light" > "$THEME_FILE"
    fi
  fi
  sleep 2
done
