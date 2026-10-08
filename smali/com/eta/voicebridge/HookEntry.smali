.class public Lcom/eta/voicebridge/HookEntry;
.super Ljava/lang/Object;

# interfaces
.implements Lde/robv/android/xposed/IXposedHookLoadPackage;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleLoadPackage(Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;)V
    .locals 8

    const-string v0, "[VoiceBridge] probe: handleLoadPackage"

    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p1, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->packageName:Ljava/lang/String;

    const-string v1, "com.google.android.inputmethod.latin"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "VoiceBridge"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "loaded in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p1, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->processName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Lcom/eta/voicebridge/HookTap;

    invoke-direct {v2}, Lcom/eta/voicebridge/HookTap;-><init>()V

    new-instance v3, Lcom/eta/voicebridge/HookResult;

    invoke-direct {v3}, Lcom/eta/voicebridge/HookResult;-><init>()V

    const-class v4, Landroid/media/AudioRecord;

    const-string v6, "startRecording"

    const/4 v0, 0x1

    new-array v5, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object v2, v5, v1

    invoke-static {v4, v6, v5}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    const-string v6, "stop"

    const/4 v0, 0x1

    new-array v5, v0, [Ljava/lang/Object;

    aput-object v2, v5, v1

    invoke-static {v4, v6, v5}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    const-string v6, "read"

    const/4 v0, 0x4

    new-array v5, v0, [Ljava/lang/Object;

    const-class v7, Ljava/nio/ByteBuffer;

    aput-object v7, v5, v1

    const/4 v1, 0x1

    const-class v7, I

    aput-object v7, v5, v1

    const/4 v1, 0x2

    const-class v7, I

    aput-object v7, v5, v1

    const/4 v1, 0x3

    aput-object v2, v5, v1

    invoke-static {v4, v6, v5}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    iget-object v4, p1, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->classLoader:Ljava/lang/ClassLoader;

    const-string v6, "read"

    const/4 v0, 0x4

    new-array v5, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-class v7, [B

    aput-object v7, v5, v1

    const/4 v1, 0x1

    const-class v7, I

    aput-object v7, v5, v1

    const/4 v1, 0x2

    const-class v7, I

    aput-object v7, v5, v1

    const/4 v1, 0x3

    aput-object v2, v5, v1

    const-string v0, "android.media.AudioRecord"

    invoke-static {v0, v4, v6, v5}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    const-string v6, "read"

    const/4 v0, 0x4

    new-array v5, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-class v7, [S

    aput-object v7, v5, v1

    const/4 v1, 0x1

    const-class v7, I

    aput-object v7, v5, v1

    const/4 v1, 0x2

    const-class v7, I

    aput-object v7, v5, v1

    const/4 v1, 0x3

    aput-object v2, v5, v1

    const-string v0, "android.media.AudioRecord"

    invoke-static {v0, v4, v6, v5}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    const-string v0, "aajc"

    invoke-static {v0, v4}, Lde/robv/android/xposed/XposedHelpers;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v2

    const-string v0, "kop"

    const-string v1, "h"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v2, v5, v6

    const/4 v6, 0x1

    aput-object v3, v5, v6

    invoke-static {v0, v4, v1, v5}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    const-string v0, "kkw"

    const-string v1, "h"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v2, v5, v6

    const/4 v6, 0x1

    aput-object v3, v5, v6

    invoke-static {v0, v4, v1, v5}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    const-string v0, "kmb"

    const-string v1, "h"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v2, v5, v6

    const/4 v6, 0x1

    aput-object v3, v5, v6

    invoke-static {v0, v4, v1, v5}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    new-instance v5, Lcom/eta/voicebridge/HookIme;

    invoke-direct {v5}, Lcom/eta/voicebridge/HookIme;-><init>()V

    const-class v0, Landroid/inputmethodservice/InputMethodService;

    const-string v1, "onCreate"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v5, v6, v7

    invoke-static {v0, v1, v6}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    const-class v0, Landroid/inputmethodservice/InputMethodService;

    const-string v1, "onStartInputView"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const-class v2, Landroid/view/inputmethod/EditorInfo;

    aput-object v2, v6, v7

    const/4 v7, 0x1

    const-class v2, Z

    aput-object v2, v6, v7

    const/4 v7, 0x2

    aput-object v5, v6, v7

    invoke-static {v0, v1, v6}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    const-class v0, Landroid/inputmethodservice/InputMethodService;

    const-string v1, "onFinishInput"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v5, v6, v7

    invoke-static {v0, v1, v6}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    const-string v0, "com.google.android.apps.inputmethod.libs.agenticdictation.AgenticDictationIme"

    invoke-static {v0, v4}, Lde/robv/android/xposed/XposedHelpers;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v2, 0x0

    array-length v3, v1

    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v5, v1, v2

    new-instance v6, Lcom/eta/voicebridge/MethodProbe;

    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/eta/voicebridge/MethodProbe;-><init>(Ljava/lang/String;)V

    invoke-static {v5, v6}, Lde/robv/android/xposed/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lde/robv/android/xposed/XC_MethodHook;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x3

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "kop"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "kkw"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "kmb"

    aput-object v3, v1, v2

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v0, :cond_2

    aget-object v3, v1, v2

    invoke-static {v3, v4}, Lde/robv/android/xposed/XposedHelpers;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v3

    const/4 v5, 0x0

    array-length v6, v3

    :goto_2
    if-ge v5, v6, :cond_1

    aget-object v7, v3, v5

    new-instance p0, Lcom/eta/voicebridge/MethodProbe;

    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/eta/voicebridge/MethodProbe;-><init>(Ljava/lang/String;)V

    invoke-static {v7, p0}, Lde/robv/android/xposed/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lde/robv/android/xposed/XC_MethodHook;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    new-instance v5, Lcom/eta/voicebridge/HookError;

    invoke-direct {v5}, Lcom/eta/voicebridge/HookError;-><init>()V

    const/4 v0, 0x3

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "kop"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "kkw"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "kmb"

    aput-object v3, v1, v2

    const/4 v2, 0x0

    :goto_3
    if-ge v2, v0, :cond_3

    aget-object v3, v1, v2

    invoke-static {v3, v4}, Lde/robv/android/xposed/XposedHelpers;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v3

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v5, v6, v7

    const-string v7, "g"

    invoke-static {v3, v7, v6}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    const/4 v7, 0x1

    new-array v6, v7, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v5, v6, v7

    const-string v7, "e"

    invoke-static {v3, v7, v6}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_3
    new-instance v5, Lcom/eta/voicebridge/HookToast;

    invoke-direct {v5}, Lcom/eta/voicebridge/HookToast;-><init>()V

    const-class v0, Landroid/widget/Toast;

    const-string v1, "show"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v5, v2, v3

    invoke-static {v0, v1, v2}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    new-instance v5, Lcom/eta/voicebridge/HookDispatch;

    invoke-direct {v5}, Lcom/eta/voicebridge/HookDispatch;-><init>()V

    const-class v0, Landroid/view/ViewGroup;

    const-string v1, "dispatchTouchEvent"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const-class v2, Landroid/view/MotionEvent;

    aput-object v2, v6, v7

    const/4 v7, 0x1

    aput-object v5, v6, v7

    invoke-static {v0, v1, v6}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    new-instance v5, Lcom/eta/voicebridge/HookKeyDef;

    invoke-direct {v5}, Lcom/eta/voicebridge/HookKeyDef;-><init>()V

    const-string v0, "com.google.android.libraries.inputmethod.widgets.SoftKeyView"

    const-string v1, "r"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const-string v2, "com.google.android.libraries.inputmethod.metadata.SoftKeyDef"

    invoke-static {v2, v4}, Lde/robv/android/xposed/XposedHelpers;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v2

    aput-object v2, v6, v7

    const/4 v7, 0x1

    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v2, v6, v7

    const/4 v7, 0x2

    aput-object v5, v6, v7

    invoke-static {v0, v4, v1, v6}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    invoke-static {v4}, Lcom/eta/voicebridge/HookKill;->install(Ljava/lang/ClassLoader;)V

    const-string v0, "VoiceBridge"

    const-string v1, "hooks installed"

    invoke-static {v0, v1}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_4
    return-void

    :catch_0
    move-exception v0

    const-string v1, "VoiceBridge"

    const-string v2, "install failed"

    invoke-static {v1, v2, v0}, Lcom/eta/voicebridge/L;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
