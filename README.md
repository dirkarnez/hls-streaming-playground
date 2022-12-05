hls-streaming-playground
========================

### Reference
- [FFmpeg DASH live video streaming (MPD file + M4S files)](https://gist.github.com/Yang-Jace-Liu/d4b33286bec30d349f42d4c7d4848a96)
  - ```sh
    # Change <INPUT FILE> to the input video file
    # 3 video qualities: <1> 1920x1080, 4800kbps. <2> 1280x720, 2400kbps. <3> 640x360, 800kbps.
    # 2 audio qualities: <1> origin audio. <2> audio sample rate: 22050 [low quality]

    ffmpeg -re -stream_loop 1 -i <INPUT FILE> -map 0 -map 0 -map 0:v -acodec libfdk_aac -vcodec libx264 -preset veryfast \
          -b:v:0 4800k -s:v:0 1920x1080 -profile:v:0 high \
          -b:v:1 2400k -s:v:1 1280x720 -profile:v:1 main \
          -b:v:2 800k  -s:v:2 640x360 -profile:v:2 baseline \
          -bf 1 -keyint_min 120 -g 60 -sc_threshold 0 -b_strategy 0 -ar:a:1 22050 \
          -use_timeline 1 -use_template 1 -window_size 5 -adaptation_sets "id=0,streams=v id=1,streams=a" \
          -f dash live.mpd
    ```
- [Creating dash mpd files with ffmpeg - YouTube](https://www.youtube.com/watch?v=GBHYdCrWJOQ)
- [dash - FFmpeg](http://underpop.online.fr/f/ffmpeg/help/dash-2.htm.gz)
- [Convert MP4 videos to HLS format in Windows using FFmpeg - YouTube](https://www.youtube.com/watch?v=qKP1Zv79Q2c)
- [FFMPEG MP4 to HLS Conversion.md](https://gist.github.com/lukebussey/4d27678c72580aeb660c19a6fb73e9ee)
  - ```sh
    ffmpeg -i filename.mp4 -codec: copy -start_number 0 -hls_time 10 -hls_list_size 0 -f hls filename.m3u8
    ```
