package org.lineageos.g81.secretcode;

import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;

public final class SecretCodeReceiver extends BroadcastReceiver {
    private static final ComponentName WRITE_IMEI_ACTIVITY = new ComponentName(
            "com.lys.writeimei", "com.lys.writeimei.WriteImei");

    @Override
    public void onReceive(Context context, Intent intent) {
        if (!"android.provider.Telephony.SECRET_CODE".equals(intent.getAction())
                || intent.getData() == null
                || !"0606".equals(intent.getData().getHost())) {
            return;
        }

        Intent writeImei = new Intent(Intent.ACTION_MAIN)
                .setComponent(WRITE_IMEI_ACTIVITY)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(writeImei);
    }
}
