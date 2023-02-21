// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import Vibrant from "node-vibrant/lib/bundle";

import jquery from 'jquery'
window.jQuery = jquery;
window.$ = jquery;

window.getImgMutedColorRgb = function (sourceTagId) {
    const colors = new Vibrant(document.getElementById(sourceTagId));
    const rgb = colors.swatches().DarkMuted.rgb;
    return `rgb(${rgb[0]}, ${rgb[1]}, ${rgb[2]})`;
}

window.getImgVibrantColorRgb = function (sourceTagId) {
    try {
        const colors = new Vibrant(document.getElementById(sourceTagId));
        const rgb = colors.swatches().DarkVibrant.rgb;
        return `rgb(${rgb[0]}, ${rgb[1]}, ${rgb[2]})`;
    } catch (ignored) {
        return 'rgb(0, 0, 0)';
    }
}

window.toggleMenu = function () {
    $('.sidebar').toggle();
}
