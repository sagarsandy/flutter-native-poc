package com.example.beans.handlers

import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Handler
import android.os.Looper

import com.example.beans.NativeStreamHandler

import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel

class BatteryUpdateManager(
    private val context: Context
) : NativeStreamHandler {

    override fun register(
        messenger: BinaryMessenger
    ) {

        EventChannel(
            messenger,
            "battery_stream"
        ).setStreamHandler(

            object : EventChannel.StreamHandler {

                private var eventSink:
                        EventChannel.EventSink? = null

                private val handler =
                    Handler(
                        Looper.getMainLooper()
                    )

                private val runnable =
                    object : Runnable {

                        override fun run() {

                            if (eventSink == null) {
                                return
                            }

                            val batteryManager =
                                context.getSystemService(
                                    Context.BATTERY_SERVICE
                                ) as BatteryManager

                            val batteryPercentage =
                                batteryManager.getIntProperty(
                                    BatteryManager.BATTERY_PROPERTY_CAPACITY
                                )

                            val batteryStatus =
                                context.registerReceiver(
                                    null,
                                    IntentFilter(
                                        Intent.ACTION_BATTERY_CHANGED
                                    )
                                )

                            val status =
                                batteryStatus?.getIntExtra(
                                    BatteryManager.EXTRA_STATUS,
                                    -1
                                ) ?: -1

                            val isCharging =
                                status ==
                                        BatteryManager.BATTERY_STATUS_CHARGING ||
                                        status ==
                                        BatteryManager.BATTERY_STATUS_FULL

                            eventSink?.success(

                                mapOf(
                                    "percentage" to batteryPercentage,
                                    "isCharging" to isCharging
                                )

                            )

                            handler.postDelayed(
                                this,
                                50
                            )
                        }
                    }

                override fun onListen(
                    arguments: Any?,
                    events: EventChannel.EventSink?
                ) {

                    eventSink = events

                    handler.post(
                        runnable
                    )
                }

                override fun onCancel(
                    arguments: Any?
                ) {

                    eventSink = null

                    handler.removeCallbacks(
                        runnable
                    )
                }
            }
        )
    }
}