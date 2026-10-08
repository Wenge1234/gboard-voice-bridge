.class public final Lcom/eta/voicebridge/HookTap;
.super Lde/robv/android/xposed/XC_MethodHook;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lde/robv/android/xposed/XC_MethodHook;-><init>()V

    return-void
.end method


# virtual methods
.method protected afterHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .locals 10

    :try_start_0
    iget-object v0, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->method:Ljava/lang/reflect/Member;

    invoke-interface {v0}, Ljava/lang/reflect/Member;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "startRecording"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v0, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    check-cast v0, Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->getSampleRate()I

    move-result v1

    invoke-virtual {v0}, Landroid/media/AudioRecord;->getChannelCount()I

    move-result v2

    invoke-static {v1, v2}, Lcom/eta/voicebridge/Asr;->start(II)V

    goto/16 :goto_3

    :cond_0
    const-string v1, "stop"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_3

    :cond_1
    const-string v1, "read"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-virtual {p1}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-nez v0, :cond_2

    return-void

    :cond_2
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-gtz v2, :cond_3

    return-void

    :cond_3
    iget-object v0, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object v3, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    array-length v3, v3

    const/4 v4, 0x3

    if-ge v3, v4, :cond_4

    iget-object v3, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    const/4 v4, 0x1

    aget-object v3, v3, v4

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    goto :goto_0

    :cond_4
    const/4 v3, 0x0

    :goto_0
    instance-of v4, v0, [B

    if-eqz v4, :cond_5

    goto :goto_3

    :cond_5
    instance-of v4, v0, [S

    if-eqz v4, :cond_7

    check-cast v0, [S

    mul-int/lit8 v4, v2, 0x2

    new-array v5, v4, [B

    const/4 v6, 0x0

    :goto_1
    if-ge v6, v2, :cond_6

    add-int v7, v3, v6

    aget-short v7, v0, v7

    const v8, 0xffff

    and-int/2addr v7, v8

    mul-int/lit8 v8, v6, 0x2

    and-int/lit16 v9, v7, 0xff

    int-to-byte v9, v9

    aput-byte v9, v5, v8

    add-int/lit8 v8, v8, 0x1

    shr-int/lit8 v7, v7, 0x8

    and-int/lit16 v7, v7, 0xff

    int-to-byte v7, v7

    aput-byte v7, v5, v8

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_6
    const/4 v0, 0x0

    goto :goto_3

    :cond_7
    instance-of v4, v0, Ljava/nio/ByteBuffer;

    if-eqz v4, :cond_9

    check-cast v0, Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    new-array v4, v2, [B

    const/4 v5, 0x0

    :goto_2
    if-ge v5, v2, :cond_8

    add-int v6, v3, v5

    invoke-virtual {v0, v6}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v6

    aput-byte v6, v4, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    :cond_8
    const/4 v0, 0x0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_9
    :goto_3
    return-void

    :catch_0
    move-exception v0

    const-string v1, "VoiceBridge/Hook"

    const-string v2, "tap failed"

    invoke-static {v1, v2, v0}, Lcom/eta/voicebridge/L;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method protected beforeHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .locals 0

    return-void
.end method
