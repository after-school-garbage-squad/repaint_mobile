package dev.asgs.repaint.repaint_mobile

import dev.asgs.beacon_plugin.BeaconManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        BeaconManager.setupForegroundScanJob(
            foregroundBetweenScanPeriod = 2800,
            foregroundScanPeriod = 2200,
        )
        BeaconManager.setupBackgroundScanJob(
            isScheduledScanJobEnabled = true,
            backgroundBetweenScanPeriod = 2800,
            backgroundScanPeriod = 2200
        )
    }
}
