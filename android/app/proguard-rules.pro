# Isar database rules
-keep class io.isar.** { *; }
-keep class * extends io.isar.IsarObject { *; }
-keep class * extends io.isar.IsarLink { *; }

# Flutter and common libraries
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Keep your models
-keep class com.ayberk.pomodoro101.features.**.models.** { *; }

# Google Play Core (Fixes R8 missing class errors for Deferred Components)
-dontwarn com.google.android.play.core.**
-keep class com.google.android.play.core.** { *; }
