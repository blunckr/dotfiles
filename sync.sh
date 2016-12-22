# --dry-run for rsync
find ~/Movies -type f -name ".*" -delete
rsync -ai --delete --size-only ~/Movies/ pi@bluncks.duckdns.org:/mnt/movies --iconv=utf-8-mac,utf-8
find ~/better_music -type f -name ".*" -delete
rsync -ai --delete --size-only ~/better_music/ pi@bluncks.duckdns.org:/mnt/music --iconv=utf-8-mac,utf-8
find ~/Pictures/Photos\ Library.photoslibrary/Masters -type f -name ".*" -delete
rsync -ai --delete --size-only ~/Pictures/Photos\ Library.photoslibrary/Masters/ pi@bluncks.duckdns.org:/mnt/pictures --iconv=utf-8-mac,utf-8

# sudo find /Users/rykerblunck/Library/Application\ Support/OpenEmu/Game\ Library/roms -type f -name ".*"
# sudo rsync -aEi --delete --size-only /Users/rykerblunck/Library/Application\ Support/OpenEmu/Game\ Library/roms/ /Volumes/TERRA/games
