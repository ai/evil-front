// Alternate syntax for `setInterval`, to be more useful in CoffeeScript.
//
//   every 1000, ->
//     addSecond()
window.every = function (ms, callback) {
    return setInterval(callback, ms);
};
