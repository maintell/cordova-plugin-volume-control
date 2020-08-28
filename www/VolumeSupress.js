cordova.define("cordova-plugin-volume-Supress.VolumeSupress", function (
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
        exec(success, error, "VolumeSupress", "setSystemVolume", [volume * 1]);
    };
    exports.getSystemVolume = function (success, error) {
        exec(success, error, "VolumeSupress", "getSystemVolume", []);
    };

    exports.setMediaVolume = function (volume, success, error) {
        if (volume > 1) {
            volume /= 100;
        }
        exec(success, error, "VolumeSupress", "setMediaVolume", [volume * 1]);
    };
    exports.getMediaVolume = function (success, error) {
        exec(success, error, "VolumeSupress", "getMediaVolume", []);
    };

    exports.setPhoneRingVolume = function (volume, success, error) {
        if (volume > 1) {
            volume /= 100;
        }
        exec(success, error, "VolumeSupress", "setPhoneRingVolume", [
            volume * 1,
        ]);
    };
    exports.getPhoneRingVolume = function (success, error) {
        exec(success, error, "VolumeSupress", "getPhoneRingVolume", []);
    };

    exports.setAlarmVolume = function (volume, success, error) {
        if (volume > 1) {
            volume /= 100;
        }
        exec(success, error, "VolumeSupress", "setAlarmVolume", [volume * 1]);
    };
    exports.getAlarmVolume = function (success, error) {
        exec(success, error, "VolumeSupress", "getAlarmVolume", []);
    };

    exports.setNotificationVolume = function (volume, success, error) {
        if (volume > 1) {
            volume /= 100;
        }
        exec(success, error, "VolumeSupress", "setNotificationVolume", [
            volume * 1,
        ]);
    };
    exports.getNotificationVolume = function (success, error) {
        exec(success, error, "VolumeSupress", "getNotificationVolume", []);
    };

    exports.MutePhoneRing = function (success, error) {
        exec(success, error, "VolumeSupress", "MutePhoneRing", []);
    };
    exports.UnMutePhoneRing = function (success, error) {
        exec(success, error, "VolumeSupress", "UnMutePhoneRing", []);
    };

    exports.MuteSystem = function (success, error) {
        exec(success, error, "VolumeSupress", "MuteSystem", []);
    };
    exports.UnMuteSystem = function (success, error) {
        exec(success, error, "VolumeSupress", "UnMuteSystem", []);
    };

    exports.MuteMedia = function (success, error) {
        exec(success, error, "VolumeSupress", "MuteMedia", []);
    };
    exports.UnMuteMedia = function (success, error) {
        exec(success, error, "VolumeSupress", "UnMuteMedia", []);
    };

    exports.MuteAlarm = function (success, error) {
        exec(success, error, "VolumeSupress", "MuteAlarm", []);
    };
    exports.UnMuteAlarm = function (success, error) {
        exec(success, error, "VolumeSupress", "UnMuteAlarm", []);
    };

    exports.MuteNotification = function (success, error) {
        exec(success, error, "VolumeSupress", "MuteNotification", []);
    };
    exports.UnMuteNotification = function (success, error) {
        exec(success, error, "VolumeSupress", "UnMuteNotification", []);
    };

    /*
    exports.getCategory = function(success, error) {
      exec(success, error, 'VolumeSupress', 'getCategory', []);
    };
    
    exports.hideVolume = function(success, error) {
      exec(success, error, 'VolumeSupress', 'hideVolume', []);
    };
    */
});
