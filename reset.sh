for f in ~/Music/*.mp3; do
    title="${f##*/}"
    title="${title%.*}"
    id3v2 --song "$title" "$f"
done
    
