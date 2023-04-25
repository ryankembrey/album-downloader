#!/usr/bin/sh

echo "Enter YouTube playlist URL:"
read playlist_url

#echo "Enter output folder name:"
#read output_folder_name

echo "Enter album name:"
read meta_album_name
album_folder_name=$(echo "$meta_album_name"| tr '[:space:]' '_' | tr '[:upper:]' '[:lower:]'| sed 's/.$//')
echo "Enter artist name:"
read meta_artist_name
art_length=${#meta_artist_name}
artist_name=$(echo "$meta_artist_name" | tr '[:space:]' '_' | tr '[:upper:]' '[:lower:]'| sed 's/.$//')
 
echo "Enter year:"
read year

echo "Enter genre:"
read meta_genre
genre=$(echo "$meta_genre"| tr '[:space:]' '_' | tr '[:upper:]' '[:lower:]'| sed 's/.$//')


# Check if genre folder already exists. Make one if not and cd
if [ -d "$genre" ]; then
    cd "$genre"
else
    mkdir "$genre"
    cd "$genre"
fi

# Check if artist folder already exists. Make one if not and cd
if [ -d "$artist_name" ]; then
    cd "$artist_name"
else
    mkdir "$artist_name"
    cd "$artist_name"
fi

mkdir "$album_folder_name"

cd "$album_folder_name"

yt-dlp --extract-audio --audio-format wav --add-metadata --metadata-from-title "%(artist)s - %(title)s" --output "%(playlist_index)02d_%(title)s.%(ext)s" "$playlist_url"

for file in *.wav; do
  track_number=${file%%_*}
  song_title=$(echo "${file#*_}" | sed 's/.wav$//' | tr '[:space:]' '_' | tr '[:upper:]' '[:lower:]')
  new_file_name="$track_number"_"$song_title".wav
  mv "$file" "$new_file_name"
  opusenc --album "$meta_album_name" --artist "$meta_artist_name" --date "$year" --genre "$genre" "$new_file_name" "$track_number"_"$song_title".opus
  rm "$new_file_name"
done


for file in ./*_.opus; do 
    mv -- "$file" "${file/_\.opus/.opus}" 
done



echo "$meta_album_name by $meta_artist_name was downloaded successfully!"
