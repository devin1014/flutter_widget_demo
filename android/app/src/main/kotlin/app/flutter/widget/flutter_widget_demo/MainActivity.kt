package app.flutter.widget.flutter_widget_demo

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        FlutterMethodChannel(flutterEngine.dartExecutor.binaryMessenger).startTimer()
        flutterEngine.plugins.add(MyFlutterViewPlugin())
    }
}
