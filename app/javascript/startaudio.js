const vibrantColor = getImgVibrantColorRgb('albumArtBox');
$('.song-name')[0].style.color = vibrantColor;
initAudioPlayer($('#mp3player').data('mp3'), vibrantColor);