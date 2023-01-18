package com.example.random_travel_app

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import com.yandex.mapkit.MapKitFactory;
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("d4ad5958-4169-4426-b6b8-be9e8b460a90")
        super.configureFlutterEngine(flutterEngine)
    }
}
