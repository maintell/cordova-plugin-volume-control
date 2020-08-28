# [Cordova Volume Control for android]

This plugin provides a simple way to interact with the volume of your `UIWebView`.

-   This plugin is built for `cordova@^3.6`.

-   This plugin currently supports Android.

## Plugin setup

Using this plugin requires [Cordova Android](https://github.com/apache/cordova-android).

1. cordova plugin add https://github.com/maintell/cordova-plugin-volume-supress

## Javascript interface

    // After device ready, create a local alias
    var VolumeSupress = cordova.plugins.VolumeSupress;

    VolumeSupress.getVolume(console.log.bind(console));
    VolumeSupress.toggleMute();
    VolumeSupress.isMuted(console.log.bind(console));
    VolumeSupress.setVolume(1.0); //Float between 0.0 and 1.0

-   Check [source](https://github.com/maintell/cordova-plugin-volume-supress/tree/master/www/VolumeSupress.js) for additional configuration.
