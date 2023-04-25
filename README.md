# album-downloader
A shell script using `yt-dlp` to download your favourite albums from YouTube.

## Dependencies:
* `yt-dlp`
* `opusenc`

## Usage:
* Clone the file `album_downloader.sh` onto your computer.
* Place it into your music directory.
* Give it executing permissions ```bash
chmod +x album_downloader.sh
```
* Run the script with 
```bash
./album_downloader.sh
```

The script then ask you for the following info. Enter details how you want them to appear in the metadata.
- Album name
- Artist name
- Year of album release
- Genre

The album will be placed in a directory tree as follows:
* ~/music/genre/artist/album/song.opus
