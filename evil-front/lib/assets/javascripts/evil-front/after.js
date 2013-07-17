// Alternate syntax for `setTimeout`, to be more useful in CoffeeScript.
//
//   after 1000, ->
//     addSecond()
window.after = function (ms, callback) {
    return setTimeout(callback, ms);
};
