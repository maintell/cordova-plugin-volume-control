package com.eissoft.cordova.plugins.volumeSupress;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.LOG;
import org.json.JSONArray;
import org.json.JSONException;

import android.content.Context;
import android.media.*;

public class VolumeSupress extends CordovaPlugin {



	public static final String setMediaVolume = "setMediaVolume";
	public static final String getMediaVolume = "getMediaVolume";

	public static final String setPhoneRingVolume = "setPhoneRingVolume";
	public static final String getPhoneRingVolume = "getPhoneRingVolume";

	public static final String setAlarmVolume = "setAlarmVolume";
	public static final String getAlarmVolume = "getAlarmVolume";

	public static final String setNotificationVolume = "setNotificationVolume";
	public static final String getNotificationVolume = "getNotificationVolume";


	public static final String setSystemVolume = "setSystemVolume";
	public static final String getSystemVolume = "getSystemVolume";


    public static final String mute = "mute";
    public static final String unmute = "unmute";

	private static final String TAG = "VolumeControl";

	private Context context;
	private AudioManager manager;

	@Override
	public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
		boolean actionState = true;
		context = cordova.getActivity().getApplicationContext();
		manager = (AudioManager)context.getSystemService(Context.AUDIO_SERVICE);
		if(setAlarmVolume.equals(action)){
			try {
				int volumeToSet = (int) Math.round(args.getDouble(0) * 100.0f);
				setAlarmVolume(volumeToSet);
				callbackContext.success();
			} catch (Exception e) {
				LOG.d(TAG, "Error setting Alarm volume " + e);
				actionState = false;
			}
		}else if(getAlarmVolume.equals(action)){
			try {
				String strVol= String.valueOf(getAlarmVolume());
				callbackContext.success(strVol);
			} catch (Exception e) {
				LOG.d(TAG, "Error setting Alarm volume " + e);
				actionState = false;
			}
		}else if(setPhoneRingVolume.equals(action)){
			try {
				int volumeToSet = (int) Math.round(args.getDouble(0) * 100.0f);
				setPhoneRingVolume(volumeToSet);
				callbackContext.success();
			} catch (Exception e) {
				LOG.d(TAG, "Error setting PhoneRing volume " + e);
				actionState = false;
			}
		}else if(getPhoneRingVolume.equals(action)){
			try {
				String strVol= String.valueOf(getPhoneRingVolume());
				callbackContext.success(strVol);
			} catch (Exception e) {
				LOG.d(TAG, "Error setting PhoneRing volume " + e);
				actionState = false;
			}
		} else if(setMediaVolume.equals(action)){
			try {
				int volumeToSet = (int) Math.round(args.getDouble(0) * 100.0f);
				setMediaVolume(volumeToSet);
				callbackContext.success();
			} catch (Exception e) {
				LOG.d(TAG, "Error setting Media volume " + e);
				actionState = false;
			}
		}else if(getMediaVolume.equals(action)){
			try {
				String strVol= String.valueOf(getMediaVolume());
				callbackContext.success(strVol);
			} catch (Exception e) {
				LOG.d(TAG, "Error setting Media volume " + e);
				actionState = false;
			}
		} else if(setNotificationVolume.equals(action)){
			try {
				int volumeToSet = (int) Math.round(args.getDouble(0) * 100.0f);
				setNotificationVolume(volumeToSet);
				callbackContext.success();
			} catch (Exception e) {
				LOG.d(TAG, "Error setting Notification volume " + e);
				actionState = false;
			}
		}else if(getNotificationVolume.equals(action)){
			try {
				String strVol= String.valueOf(getNotificationVolume());
				callbackContext.success(strVol);
			} catch (Exception e) {
				LOG.d(TAG, "Error setting Notification volume " + e);
				actionState = false;
			}
		} else if(setSystemVolume.equals(action)){
			try {
				int volumeToSet = (int) Math.round(args.getDouble(0) * 100.0f);
				setSystemVolume(volumeToSet);
				callbackContext.success();
			} catch (Exception e) {
				LOG.d(TAG, "Error setting System volume " + e);
				actionState = false;
			}
		}else if(getSystemVolume.equals(action)){
			try {
				String strVol= String.valueOf(getSystemVolume());
				callbackContext.success(strVol);
			} catch (Exception e) {
				LOG.d(TAG, "Error setting System volume " + e);
				actionState = false;
			}
		} else if(action.equals("MutePhoneRing")){
            try {
				setPhoneRingMute(true);
                callbackContext.success();
            } catch (Exception e) {
                LOG.d(TAG, "Error MutePhoneRing " + e);
                actionState = false;
            }
        } else if(action.equals("UnMutePhoneRing")){
            try {
				setPhoneRingMute(false);
                callbackContext.success();
            } catch (Exception e) {
                LOG.d(TAG, "Error UnMutePhoneRing" + e);
                actionState = false;
            }
        } else if(action.equals("MuteSystem")){
			try {
				setSystemMute(true);
				callbackContext.success();
			} catch (Exception e) {
				LOG.d(TAG, "Error MutePhoneRing " + e);
				actionState = false;
			}
		} else if(action.equals("UnMuteSystem")){
			try {
				setSystemMute(false);
				callbackContext.success();
			} catch (Exception e) {
				LOG.d(TAG, "Error UnMutePhoneRing" + e);
				actionState = false;
			}
		} else if(action.equals("MuteMedia")){
			try {
				setMusicMute(true);
				callbackContext.success();
			} catch (Exception e) {
				LOG.d(TAG, "Error MuteMedia " + e);
				actionState = false;
			}
		} else if(action.equals("UnMuteMedia")){
			try {
				setMusicMute(false);
				callbackContext.success();
			} catch (Exception e) {
				LOG.d(TAG, "Error UnMuteMedia" + e);
				actionState = false;
			}
		} else if(action.equals("MuteAlarm")){
			try {
				setAlarmMute(true);
				callbackContext.success();
			} catch (Exception e) {
				LOG.d(TAG, "Error MuteAlarm " + e);
				actionState = false;
			}
		} else if(action.equals("UnMuteAlarm")){
			try {
				setAlarmMute(false);
				callbackContext.success();
			} catch (Exception e) {
				LOG.d(TAG, "Error UnMuteAlarm" + e);
				actionState = false;
			}
		}else if(action.equals("MuteNotification")){
			try {
				setNotificationMute(true);
				callbackContext.success();
			} catch (Exception e) {
				LOG.d(TAG, "Error MuteAlarm " + e);
				actionState = false;
			}
		} else if(action.equals("UnMuteNotification")){
			try {
				setNotificationMute(false);
				callbackContext.success();
			} catch (Exception e) {
				LOG.d(TAG, "Error UnMuteAlarm" + e);
				actionState = false;
			}
		} else {
			actionState = false;
		}
		return actionState;
	}



	private void setNotificationMute(boolean muted){
		setStreamMuted(AudioManager.STREAM_NOTIFICATION,muted);
	}

	private void setAlarmMute(boolean muted){
		setStreamMuted(AudioManager.STREAM_ALARM,muted);
	}

	private void setMusicMute(boolean muted){
		setStreamMuted(AudioManager.STREAM_MUSIC,muted);
	}

	private void setSystemMute(boolean muted){
		setStreamMuted(AudioManager.STREAM_SYSTEM,muted);
	}

	private void setPhoneRingMute(boolean muted){
		setStreamMuted(AudioManager.STREAM_RING,muted);
	}

    private void setStreamMuted(int streamType, boolean enabled){
		if(enabled) {
			manager.adjustStreamVolume(streamType, AudioManager.ADJUST_MUTE, AudioManager.FLAG_REMOVE_SOUND_AND_VIBRATE);
		}else{
			manager.adjustStreamVolume(streamType, AudioManager.ADJUST_UNMUTE, AudioManager.FLAG_REMOVE_SOUND_AND_VIBRATE);
		}
    }

	/**
	 * 设置系统音量
	 * @param volumePercent 按照百分比的音量（0~100）
	 * @return
	 */
	private boolean setSystemVolume(int volumePercent){
		try {
			int maxVolume = manager.getStreamMaxVolume(AudioManager.STREAM_SYSTEM);
			int volume = (int) Math.round((volumePercent * maxVolume) * 1.0 / 100.0);
			manager.setStreamVolume(AudioManager.STREAM_SYSTEM, volume, 0);
			return true;
		} catch (Exception e) {
			LOG.d(TAG, "Error setting setMediaVolume: " + e);
			return false;
		}
	}

	/**
	 * 获取系统音量
	 * @return 返回通知音量百分比(0~100)
	 */
	private int getSystemVolume(){
		try {
			int volLevel;
			int maxVolume = manager.getStreamMaxVolume(AudioManager.STREAM_SYSTEM);
			int currSystemVol = manager.getStreamVolume(AudioManager.STREAM_SYSTEM);
			volLevel = (int) Math.round((currSystemVol * 100.0) / maxVolume);
			return volLevel;
		} catch (Exception e) {
			LOG.d(TAG, "Error getting setMediaVolume: " + e);
			return -1;
		}
	}


	/**
	 * 设置通知音量
	 * @param volumePercent 按照百分比的音量（0~100）
	 * @return
	 */
	private boolean setNotificationVolume(int volumePercent){
		try {
			int maxVolume = manager.getStreamMaxVolume(AudioManager.STREAM_NOTIFICATION);
			int volume = (int) Math.round((volumePercent * maxVolume) * 1.0 / 100.0);
			manager.setStreamVolume(AudioManager.STREAM_NOTIFICATION, volume, 0);
			return true;
		} catch (Exception e) {
			LOG.d(TAG, "Error setting setMediaVolume: " + e);
			return false;
		}
	}

	/**
	 * 获取通知音量
	 * @return 返回通知音量百分比(0~100)
	 */
	private int getNotificationVolume(){
		try {
			int volLevel;
			int maxVolume = manager.getStreamMaxVolume(AudioManager.STREAM_NOTIFICATION);
			int currSystemVol = manager.getStreamVolume(AudioManager.STREAM_NOTIFICATION);
			volLevel = (int) Math.round((currSystemVol * 100.0) / maxVolume);
			return volLevel;
		} catch (Exception e) {
			LOG.d(TAG, "Error getting setMediaVolume: " + e);
			return -1;
		}
	}


	/**
	 * 设置闹钟音量
	 * @param volumePercent 按照百分比的音量（0~100）
	 * @return
	 */
	private boolean setAlarmVolume(int volumePercent){
		try {
			int maxVolume = manager.getStreamMaxVolume(AudioManager.STREAM_ALARM);
			int volume = (int) Math.round((volumePercent * maxVolume) * 1.0 / 100.0);
			manager.setStreamVolume(AudioManager.STREAM_ALARM, volume, 0);
			return true;
		} catch (Exception e) {
			LOG.d(TAG, "Error setting setMediaVolume: " + e);
			return false;
		}
	}

	/**
	 * 获取闹钟音量
	 * @return 返回闹钟音量百分比(0~100)
	 */
	private int getAlarmVolume(){
		try {
			int volLevel;
			int maxVolume = manager.getStreamMaxVolume(AudioManager.STREAM_ALARM);
			int currSystemVol = manager.getStreamVolume(AudioManager.STREAM_ALARM);
			volLevel = (int) Math.round((currSystemVol * 100.0) / maxVolume);
			return volLevel;
		} catch (Exception e) {
			LOG.d(TAG, "Error getting setMediaVolume: " + e);
			return -1;
		}
	}




	/**
	 * 设置响铃音量
	 * @param volumePercent 按照百分比的音量（0~100）
	 * @return
	 */
	private boolean setPhoneRingVolume(int volumePercent){
		try {
			int maxVolume = manager.getStreamMaxVolume(AudioManager.STREAM_RING);
			int volume = (int) Math.round((volumePercent * maxVolume) * 1.0 / 100.0);
			manager.setStreamVolume(AudioManager.STREAM_RING, volume, 0);
			return true;
		} catch (Exception e) {
			LOG.d(TAG, "Error setting setMediaVolume: " + e);
			return false;
		}
	}

	/**
	 * 获取响铃音量
	 * @return 返回响铃音量百分比(0~100)
	 */
	private int getPhoneRingVolume(){
		try {
			int volLevel;
			int maxVolume = manager.getStreamMaxVolume(AudioManager.STREAM_RING);
			int currSystemVol = manager.getStreamVolume(AudioManager.STREAM_RING);
			volLevel = (int) Math.round((currSystemVol * 100.0) / maxVolume);
			return volLevel;
		} catch (Exception e) {
			LOG.d(TAG, "Error getting setMediaVolume: " + e);
			return -1;
		}
	}



	/**
	 * 设置媒体音量
	 * @param volumePercent 按照百分比的音量（0~100）
	 * @return
	 */
	private boolean setMediaVolume(int volumePercent){
		try {
			int maxVolume = manager.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
			int volume = (int) Math.round((volumePercent * maxVolume) * 1.0 / 100.0);
			manager.setStreamVolume(AudioManager.STREAM_MUSIC, volume, 0);
			return true;
		} catch (Exception e) {
			LOG.d(TAG, "Error setting setMediaVolume: " + e);
			return false;
		}
	}

	/**
	 * 获取媒体音量
	 * @return 返回媒体音量
	 */
	private int getMediaVolume(){
		try {
			int volLevel;
			int maxVolume = manager.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
			int currSystemVol = manager.getStreamVolume(AudioManager.STREAM_MUSIC);
			volLevel = (int) Math.round((currSystemVol * 100.0) / maxVolume);
			return volLevel;
		} catch (Exception e) {
			LOG.d(TAG, "Error getting setMediaVolume: " + e);
			return -1;
		}
	}


}
