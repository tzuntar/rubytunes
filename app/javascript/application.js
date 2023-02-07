// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "./combobox"

const getImgMutedColorRgb = function (sourceTagId) {
    const colors = new Vibrant(document.getElementById(sourceTagId));
    const rgb = colors.swatches().DarkMuted.rgb;
    return `rgb(${rgb[0]}, ${rgb[1]}, ${rgb[2]})`;
}

const getImgVibrantColorRgb = function (sourceTagId) {
    try {
        const colors = new Vibrant(document.getElementById(sourceTagId));
        const rgb = colors.swatches().DarkVibrant.rgb;
        return `rgb(${rgb[0]}, ${rgb[1]}, ${rgb[2]})`;
    } catch (ignored) {
        return 'rgb(0, 0, 0)';
    }
}
