.class public final Lcom/eta/voicebridge/Capture;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field public static rec:Landroid/media/AudioRecord;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static feedFile(Ljava/io/File;)V
    .locals 7

    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const/16 v1, 0x1900

    new-array v1, v1, [B

    const-string v2, "VoiceBridge/Capture"

    const-string v3, "test file audio source"

    invoke-static {v2, v3}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    sget-boolean v2, Lcom/eta/voicebridge/Asr;->capturing:Z

    if-eqz v2, :cond_1

    array-length v2, v1

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/FileInputStream;->read([BII)I

    move-result v2

    if-gtz v2, :cond_0

    invoke-static {}, Lcom/eta/voicebridge/Asr;->stop()V

    goto :goto_1

    :cond_0
    invoke-static {v1, v3, v2}, Lcom/eta/voicebridge/Asr;->feed([BII)V

    const-wide/16 v2, 0x3c

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    goto :goto_0

    :cond_1
    :goto_1
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    const-string v0, "VoiceBridge/Capture"

    const-string v1, "test file exhausted"

    invoke-static {v0, v1}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    :try_start_0
    new-instance v0, Ljava/io/File;

    const-string v1, "/data/local/tmp/eta/asr_test.pcm"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcom/eta/voicebridge/Capture;->feedFile(Ljava/io/File;)V

    return-void

    :cond_0
    const/4 v1, 0x1

    const/16 v2, 0x3e80

    const/16 v3, 0x10

    const/4 v4, 0x2

    invoke-static {v2, v3, v4}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result v5

    if-gtz v5, :cond_1

    const/16 v5, 0x3200

    :cond_1
    mul-int/lit8 v5, v5, 0x2

    new-instance v0, Landroid/media/AudioRecord;

    invoke-direct/range {v0 .. v5}, Landroid/media/AudioRecord;-><init>(IIIII)V

    sput-object v0, Lcom/eta/voicebridge/Capture;->rec:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->startRecording()V

    const-string v1, "VoiceBridge/Capture"

    const-string v2, "own mic started"

    invoke-static {v1, v2}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v1, 0x1900

    new-array v6, v1, [B

    const/4 v7, 0x0

    :goto_0
    sget-boolean v1, Lcom/eta/voicebridge/Asr;->capturing:Z

    if-eqz v1, :cond_3

    const/16 v1, 0x12c

    if-ge v7, v1, :cond_3

    const/4 v2, 0x0

    array-length v3, v6

    invoke-virtual {v0, v6, v2, v3}, Landroid/media/AudioRecord;->read([BII)I

    move-result v1

    if-lez v1, :cond_2

    invoke-static {v6, v2, v1}, Lcom/eta/voicebridge/Asr;->feed([BII)V

    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    :cond_3
    invoke-static {}, Lcom/eta/voicebridge/Asr;->stop()V

    invoke-virtual {v0}, Landroid/media/AudioRecord;->stop()V

    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    const-string v1, "VoiceBridge/Capture"

    const-string v2, "own mic stopped"

    invoke-static {v1, v2}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    const-string v1, "VoiceBridge/Capture"

    const-string v2, "capture failed"

    invoke-static {v1, v2, v0}, Lcom/eta/voicebridge/L;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
