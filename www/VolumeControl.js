cordova.define("cordova-plugin-volume-control.VolumeControl", function (
    require,
    exports,
    module
) {
    var exec = require("cordova/exec");

    function defaults(object, source) {
        if (!object) object = {};
        for (var prop in source) {
            if (typeof object[prop] === "undefined") {
                object[prop] = source[prop];
            }
        }
        return object;
    }

    exports.setSystemVolume = function (volume, success, error) {
        if (volume > 1) {
            volume /= 100;
        }
        exec(success, error, "VolumeControl", "setSystemVolume", [volume * 1]);
    };
    exports.getSystemVolume = function (success, error) {
        exec(success, error, "VolumeControl", "getSystemVolume", []);
    };

    exports.setMediaVolume = function (volume, success, error) {
        if (volume > 1) {
            volume /= 100;
        }
        exec(success, error, "VolumeControl", "setMediaVolume", [volume * 1]);
    };
    exports.getMediaVolume = function (success, error) {
        exec(success, error, "VolumeControl", "getMediaVolume", []);
    };

    exports.setPhoneRingVolume = function (volume, success, error) {
        if (volume > 1) {
            volume /= 100;
        }
        exec(success, error, "VolumeControl", "setPhoneRingVolume", [
            volume * 1,
        ]);
    };
    exports.getPhoneRingVolume = function (success, error) {
        exec(success, error, "VolumeControl", "getPhoneRingVolume", []);
    };

    exports.setAlarmVolume = function (volume, success, error) {
        if (volume > 1) {
            volume /= 100;
        }
        exec(success, error, "VolumeControl", "setAlarmVolume", [volume * 1]);
    };
    exports.getAlarmVolume = function (success, error) {
        exec(success, error, "VolumeControl", "getAlarmVolume", []);
    };

    exports.setNotificationVolume = function (volume, success, error) {
        if (volume > 1) {
            volume /= 100;
        }
        exec(success, error, "VolumeControl", "setNotificationVolume", [
            volume * 1,
        ]);
    };
    exports.getNotificationVolume = function (success, error) {
        exec(success, error, "VolumeControl", "getNotificationVolume", []);
    };

    exports.MutePhoneRing = function (success, error) {
        exec(success, error, "VolumeControl", "MutePhoneRing", []);
    };
    exports.UnMutePhoneRing = function (success, error) {
        exec(success, error, "VolumeControl", "UnMutePhoneRing", []);
    };

    exports.MuteSystem = function (success, error) {
        exec(success, error, "VolumeControl", "MuteSystem", []);
    };
    exports.UnMuteSystem = function (success, error) {
        exec(success, error, "VolumeControl", "UnMuteSystem", []);
    };

    exports.MuteMedia = function (success, error) {
        exec(success, error, "VolumeControl", "MuteMedia", []);
    };
    exports.UnMuteMedia = function (success, error) {
        exec(success, error, "VolumeControl", "UnMuteMedia", []);
    };

    exports.MuteAlarm = function (success, error) {
        exec(success, error, "VolumeControl", "MuteAlarm", []);
    };
    exports.UnMuteAlarm = function (success, error) {
        exec(success, error, "VolumeControl", "UnMuteAlarm", []);
    };

    exports.MuteNotification = function (success, error) {
        exec(success, error, "VolumeControl", "MuteNotification", []);
    };
    exports.UnMuteNotification = function (success, error) {
        exec(success, error, "VolumeControl", "UnMuteNotification", []);
    };

    /*
    exports.getCategory = function(success, error) {
      exec(success, error, 'VolumeControl', 'getCategory', []);
    };
    
    exports.hideVolume = function(success, error) {
      exec(success, error, 'VolumeControl', 'hideVolume', []);
    };
    */
});
