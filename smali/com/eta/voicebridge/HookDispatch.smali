.class public final Lcom/eta/voicebridge/HookDispatch;
.super Lde/robv/android/xposed/XC_MethodHook;


# static fields
.field private static lastToggle:J

.field public static lastTouchAt:J

.field private static final loc:[I

.field private static logcnt:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x2

    new-array v0, v0, [I

    sput-object v0, Lcom/eta/voicebridge/HookDispatch;->loc:[I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lde/robv/android/xposed/XC_MethodHook;-><init>()V

    return-void
.end method


# virtual methods
.method protected afterHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .locals 0

    return-void
.end method

.method protected beforeHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .locals 8

    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    sput-wide v6, Lcom/eta/voicebridge/HookDispatch;->lastTouchAt:J

    sget-object v0, Lcom/eta/voicebridge/Find;->micView:Landroid/view/View;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    sget-object v1, Lcom/eta/voicebridge/Ime;->ime:Landroid/inputmethodservice/InputMethodService;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/inputmethodservice/InputMethodService;->getWindow()Landroid/app/Dialog;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-static {v1}, Lcom/eta/voicebridge/Find;->takeAll(Landroid/view/View;)V

    :cond_1
    sget-object v0, Lcom/eta/voicebridge/Find;->micView:Landroid/view/View;

    :goto_0
    if-eqz v0, :cond_4

    iget-object v1, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    check-cast v1, Landroid/view/MotionEvent;

    if-eqz v1, :cond_4

    sget-object v2, Lcom/eta/voicebridge/HookDispatch;->loc:[I

    invoke-virtual {v0, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v5

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v6

    if-lez v5, :cond_4

    if-lez v6, :cond_4

    invoke-virtual {v1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v3

    invoke-virtual {v1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v4

    const/4 v7, 0x0

    aget v7, v2, v7

    add-int/lit8 v7, v7, -0x18

    int-to-float v7, v7

    cmpg-float v7, v3, v7

    if-ltz v7, :cond_3

    const/4 v7, 0x0

    aget v7, v2, v7

    add-int/2addr v7, v5

    add-int/lit8 v7, v7, 0x18

    int-to-float v7, v7

    cmpl-float v7, v3, v7

    if-gtz v7, :cond_3

    const/4 v7, 0x1

    aget v7, v2, v7

    add-int/lit8 v7, v7, -0x18

    int-to-float v7, v7

    cmpg-float v7, v4, v7

    if-ltz v7, :cond_3

    const/4 v7, 0x1

    aget v2, v2, v7

    add-int/2addr v2, v6

    add-int/lit8 v2, v2, 0x18

    int-to-float v2, v2

    cmpl-float v2, v4, v2

    if-gtz v2, :cond_3

    invoke-virtual {v1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    and-int/lit16 v1, v1, 0xff

    if-nez v1, :cond_4

    sget v1, Lcom/eta/voicebridge/HookDispatch;->logcnt:I

    add-int/lit8 v1, v1, 0x1

    sput v1, Lcom/eta/voicebridge/HookDispatch;->logcnt:I

    const/16 v2, 0xc

    if-ge v1, v2, :cond_2

    const-string v1, "VoiceBridge/Dispatch"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "down xy="

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v6, ","

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v6, " mic="

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v6, Lcom/eta/voicebridge/HookDispatch;->loc:[I

    const/4 v7, 0x0

    aget v6, v6, v7

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ","

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v6, Lcom/eta/voicebridge/HookDispatch;->loc:[I

    const/4 v7, 0x1

    aget v6, v6, v7

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    sget-wide v4, Lcom/eta/voicebridge/HookDispatch;->lastToggle:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x1f4

    cmp-long v6, v2, v4

    if-ltz v6, :cond_4

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    sput-wide v2, Lcom/eta/voicebridge/HookDispatch;->lastToggle:J

    const-string v0, "VoiceBridge"

    const-string v1, "mic pressed -> doubao dictation toggle"

    invoke-static {v0, v1}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/eta/voicebridge/Asr;->toggle()V

    return-void

    :cond_3
    sget-boolean v2, Lcom/eta/voicebridge/Asr;->capturing:Z

    if-eqz v2, :cond_4

    invoke-virtual {v1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    and-int/lit16 v1, v1, 0xff

    if-eqz v1, :cond_4

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    sget-wide v4, Lcom/eta/voicebridge/Asr;->startTime:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x320

    cmp-long v6, v2, v4

    if-ltz v6, :cond_4

    const-string v0, "VoiceBridge"

    const-string v1, "manual interaction -> auto finish dictation"

    invoke-static {v0, v1}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/eta/voicebridge/Asr;->stop()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_4
    return-void

    :catch_0
    move-exception v0

    const-string v1, "VoiceBridge/Dispatch"

    const-string v2, "dispatch hook error"

    invoke-static {v1, v2, v0}, Lcom/eta/voicebridge/L;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
