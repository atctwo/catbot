ffmpeg -pattern_type glob -i '*.png' -framerate 60 -c:v libx264 -profile:v high -crf 20 -pix_fmt yuv420p exploded_view.mp4
