# Album_Downloader
A shell script using yt-dlp to download your favourite albums from YouTube.

Dependencies:
* yt-dlp
* opusenc

Usage:
* Clone the download the file 'album_downloader.sh' onto your computer
* Place it into your music directory
* Edit the shebang to match your shell (eg for bash #!/usr/bin/bash)
* Give it executing permissions (chmod +x album_downloader.sh)
* Run the script with './album_downloader.sh'

The album will be placed in a directory tree as follows:
* Music/genre/artist/album/song.opus
