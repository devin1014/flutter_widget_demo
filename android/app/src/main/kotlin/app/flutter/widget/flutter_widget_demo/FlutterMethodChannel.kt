package app.flutter.widget.flutter_widget_demo

import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.Result
import java.util.*
import kotlin.concurrent.timerTask

class FlutterMethodChannel(messenger: BinaryMessenger) : MethodChannel.MethodCallHandler {

    private val channel: MethodChannel = MethodChannel(messenger, "com.flutter.demo.MethodChannel1")

    init {
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "hello") {
            val a = call.argument<Int>("a")
            val b = call.argument<Int>("b")
            if (a != null && b != null) {
                result.success(a + b)
            } else {
                result.error("-1", "error...", null)
            }
        }
    }

    private val timer = Timer()
    private var index = 0
    private val params = mutableMapOf<String, Int>()
    private val handler = Handler(Looper.getMainLooper())

    fun startTimer(delay: Long = 5000) {
        timer.scheduleAtFixedRate(timerTask {
            params["result"] = index++
            handler.post { channel.invokeMethod("timer", params) }
        }, delay, 1 * 1000)
    }

}