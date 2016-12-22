# --dry-run for rsync
find ~/Movies -type f -name ".*" -delete
rsync -ai --delete --size-only ~/Movies/ /Volumes/TERRA/movies
find ~/better_music -type f -name ".*" -delete
rsync -ai --delete --size-only ~/better_music/ /Volumes/TERRA/music
find ~/Pictures/Photos\ Library.photoslibrary/Masters -type f -name ".*" -delete
rsync -ai --delete --size-only ~/Pictures/Photos\ Library.photoslibrary/Masters/ /Volumes/TERRA/photos

# sudo find /Users/rykerblunck/Library/Application\ Support/OpenEmu/Game\ Library/roms -type f -name ".*"
# sudo rsync -aEi --delete --size-only /Users/rykerblunck/Library/Application\ Support/OpenEmu/Game\ Library/roms/ /Volumes/TERRA/games
