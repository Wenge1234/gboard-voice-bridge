.class public final Lcom/eta/voicebridge/HookIme;
.super Lde/robv/android/xposed/XC_MethodHook;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lde/robv/android/xposed/XC_MethodHook;-><init>()V

    return-void
.end method


# virtual methods
.method protected afterHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .locals 5

    :try_start_0
    iget-object v0, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->method:Ljava/lang/reflect/Member;

    invoke-interface {v0}, Ljava/lang/reflect/Member;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "VoiceBridge/Ime"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ime event: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "onCreate"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v0, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    check-cast v0, Landroid/inputmethodservice/InputMethodService;

    sput-object v0, Lcom/eta/voicebridge/Ime;->ime:Landroid/inputmethodservice/InputMethodService;

    const-string v0, "VoiceBridge/Ime"

    const-string v1, "ime captured"

    invoke-static {v0, v1}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string v1, "onFinishInput"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    sget-boolean v0, Lcom/eta/voicebridge/Asr;->capturing:Z

    if-eqz v0, :cond_2

    const-string v0, "VoiceBridge/Ime"

    const-string v1, "input finished -> stop dictation"

    invoke-static {v0, v1}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/eta/voicebridge/Asr;->stop()V

    goto :goto_0

    :cond_1
    const-string v1, "onStartInputView"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Lcom/eta/voicebridge/Ime;->ime:Landroid/inputmethodservice/InputMethodService;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/inputmethodservice/InputMethodService;->getWindow()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_2

    const-string v1, "VoiceBridge/Ime"

    const-string v2, "scan start"

    invoke-static {v1, v2}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/eta/voicebridge/Find;->takeAll(Landroid/view/View;)V

    new-instance v1, Lcom/eta/voicebridge/Scan;

    invoke-direct {v1, v0}, Lcom/eta/voicebridge/Scan;-><init>(Landroid/view/View;)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    new-instance v1, Lcom/eta/voicebridge/Scan;

    invoke-direct {v1, v0}, Lcom/eta/voicebridge/Scan;-><init>(Landroid/view/View;)V

    const-wide/16 v2, 0x5dc

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v1, "VoiceBridge/Ime"

    const-string v2, "ime hook failed"

    invoke-static {v1, v2, v0}, Lcom/eta/voicebridge/L;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method protected beforeHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .locals 0

    return-void
.end method
