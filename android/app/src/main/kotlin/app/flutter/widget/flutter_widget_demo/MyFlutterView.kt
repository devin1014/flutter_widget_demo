package app.flutter.widget.flutter_widget_demo

import android.annotation.SuppressLint
import android.content.Context
import android.util.Log
import android.view.View
import android.widget.TextView
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class MyFlutterView(context: Context, private val viewId: Int, args: Any?, private val messenger: BinaryMessenger) : PlatformView, MethodCallHandler {

    @SuppressLint("SetTextI18n")
    private val textView: TextView = TextView(context).apply {
        id = viewId
        text = "MyFlutterView\n" +
                "viewId: $viewId\n" +
                "args: $args"
    }

    override fun getView(): View = textView

    override fun dispose() {
    }

    private var channel: MethodChannel? = null

    override fun onFlutterViewAttached(flutterView: View) {
        //NOTE: flutterView.id always 1, use viewId instead.
        //NOTE: flutterView.id always 1, use viewId instead.
        //NOTE: flutterView.id always 1, use viewId instead.
        Log.i(javaClass.simpleName, "onFlutterViewAttached: $viewId")
        if (channel == null) {
            channel = MethodChannel(messenger, flutterViewMethodChannel + viewId)
            Log.i(javaClass.simpleName, "register channel: ${flutterViewMethodChannel + viewId}")
        }
        channel?.setMethodCallHandler(this)
    }

    override fun onFlutterViewDetached() {
        Log.w(javaClass.simpleName, "onFlutterViewDetached")
        channel?.setMethodCallHandler(null)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "setText" || call.method == "text") {
            val text = call.argument<String?>("text")
            if (!text.isNullOrEmpty()) {
                textView.text = text
                result.success(true)
            } else {
                result.success(false)
            }
        } else {
            result.success(false)
        }
    }
}

class MyFlutterViewFactory(private val messenger: BinaryMessenger) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        return MyFlutterView(context, viewId, args, messenger)
    }

}

private const val flutterViewPlugin = "plugins.flutter.io/my_flutter_view"
private const val flutterViewMethodChannel = "plugins.flutter.io/my_flutter_view.method_channel"

class MyFlutterViewPlugin : FlutterPlugin {

//    companion object {
//        @JvmStatic
//        fun registerWith(registrar: PluginRegistry.Registrar) {
//            registrar.platformViewRegistry()
//                    .registerViewFactory(flutterViewName, MyFlutterViewFactory(registrar.messenger()))
//        }
//    }

    override fun onAttachedToEngine(binding: FlutterPluginBinding) {
        val messenger: BinaryMessenger = binding.binaryMessenger
        binding
                .platformViewRegistry
                .registerViewFactory(flutterViewPlugin, MyFlutterViewFactory(messenger))
    }

    override fun onDetachedFromEngine(binding: FlutterPluginBinding) {
    }
}