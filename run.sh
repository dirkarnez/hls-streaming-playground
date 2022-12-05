export PATH="/P/Downloads/ffmpeg-2021-10-28-git-e84c83ef98-full_build/bin"

export input="./random.mp4"

ffmpeg -i $input -profile:v baseline -level 3.0 -s 640x360 -start_number 0 -hls_time 10 -hls_list_size 0 -f hls index.m3u8

# https://github.com/GoogleChromeLabs/simplehttp2server
simplehttp2server_windows_amd64.exe -listen=:9998 -cors="*"

read -p "sad"
