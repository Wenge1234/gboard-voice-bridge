.class public final Lcom/eta/voicebridge/Asr;
.super Ljava/lang/Object;


# static fields
.field public static volatile capturing:Z

.field public static volatile googlePulse:J

.field public static volatile isFinal:Z

.field public static outbox:Ljava/util/concurrent/LinkedBlockingQueue;

.field public static pending:[B

.field public static pendingLen:I

.field public static sampleRate:I

.field public static seq:I

.field public static volatile sink:Ljava/lang/Object;

.field public static volatile startTime:J

.field public static volatile text:Ljava/lang/String;

.field public static volatile toasted:Z

.field public static volatile ws:Lcom/eta/voicebridge/Ws;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>(I)V

    sput-object v0, Lcom/eta/voicebridge/Asr;->outbox:Ljava/util/concurrent/LinkedBlockingQueue;

    const/16 v0, 0x6400

    new-array v0, v0, [B

    sput-object v0, Lcom/eta/voicebridge/Asr;->pending:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static feed([BII)V
    .locals 10

    :try_start_0
    sget-boolean v0, Lcom/eta/voicebridge/Asr;->capturing:Z

    if-eqz v0, :cond_3

    new-array v0, p2, [B

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    sget v1, Lcom/eta/voicebridge/Asr;->sampleRate:I

    const/16 v2, 0x3e80

    if-eq v1, v2, :cond_0

    invoke-static {v0}, Lcom/eta/voicebridge/Asr;->resample([B)[B

    move-result-object v0

    :cond_0
    array-length v1, v0

    sget v2, Lcom/eta/voicebridge/Asr;->pendingLen:I

    add-int/2addr v2, v1

    sget-object v3, Lcom/eta/voicebridge/Asr;->pending:[B

    array-length v4, v3

    if-gt v2, v4, :cond_1

    goto :goto_0

    :cond_1
    mul-int/lit8 v4, v4, 0x2

    if-lt v4, v2, :cond_2

    move v4, v2

    :cond_2
    new-array v5, v4, [B

    const/4 v6, 0x0

    sget v7, Lcom/eta/voicebridge/Asr;->pendingLen:I

    invoke-static {v3, v6, v5, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    sput-object v5, Lcom/eta/voicebridge/Asr;->pending:[B

    :goto_0
    const/4 v3, 0x0

    sget-object v4, Lcom/eta/voicebridge/Asr;->pending:[B

    sget v5, Lcom/eta/voicebridge/Asr;->pendingLen:I

    invoke-static {v0, v3, v4, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    sput v2, Lcom/eta/voicebridge/Asr;->pendingLen:I

    :goto_1
    sget v2, Lcom/eta/voicebridge/Asr;->pendingLen:I

    const/16 v3, 0x1900

    if-lt v2, v3, :cond_3

    new-array v4, v3, [B

    sget-object v5, Lcom/eta/voicebridge/Asr;->pending:[B

    const/4 v6, 0x0

    invoke-static {v5, v6, v4, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    sub-int v7, v2, v3

    invoke-static {v5, v3, v5, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    sput v7, Lcom/eta/voicebridge/Asr;->pendingLen:I

    sget-object v5, Lcom/eta/voicebridge/Asr;->outbox:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v5, v4}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z

    goto :goto_1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_3
    return-void

    :catch_0
    move-exception v0

    const-string v1, "VoiceBridge/Asr"

    const-string v2, "feed failed"

    invoke-static {v1, v2, v0}, Lcom/eta/voicebridge/L;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static isFinal()Z
    .locals 1

    sget-boolean v0, Lcom/eta/voicebridge/Asr;->isFinal:Z

    return v0
.end method

.method public static onServerFrame([B)V
    .locals 10

    :try_start_0
    array-length v0, p0

    const-string v1, "VoiceBridge/Asr"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onServerFrame len="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x4

    if-lt v0, v1, :cond_4

    const/4 v0, 0x1

    aget-byte v0, p0, v0

    shr-int/lit8 v1, v0, 0x4

    and-int/lit8 v6, v1, 0xf

    and-int/lit8 v2, v0, 0xf

    const/4 v3, 0x4

    const/4 v4, 0x1

    if-ne v2, v4, :cond_0

    goto :goto_0

    :cond_0
    const/4 v4, 0x3

    if-ne v2, v4, :cond_1

    :goto_0
    add-int/lit8 v3, v3, 0x4

    :cond_1
    array-length v0, p0

    add-int/lit8 v4, v3, 0x4

    if-lt v0, v4, :cond_4

    aget-byte v0, p0, v3

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x18

    add-int/lit8 v4, v3, 0x1

    aget-byte v4, p0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x10

    or-int/2addr v0, v4

    add-int/lit8 v4, v3, 0x2

    aget-byte v4, p0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x8

    or-int/2addr v0, v4

    add-int/lit8 v4, v3, 0x3

    aget-byte v4, p0, v4

    and-int/lit16 v4, v4, 0xff

    or-int/2addr v0, v4

    new-instance v5, Ljava/lang/String;

    add-int/lit8 v3, v3, 0x4

    const-string v7, "UTF-8"

    invoke-direct {v5, p0, v3, v0, v7}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    const-string v0, "VoiceBridge/Asr"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "resp: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v0, 0x9

    if-ne v6, v0, :cond_3

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v3, "result"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    const-string v3, "result"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v3, "text"

    const-string v4, ""

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4

    sput-object v0, Lcom/eta/voicebridge/Asr;->text:Ljava/lang/String;

    sget-boolean v1, Lcom/eta/voicebridge/Asr;->toasted:Z

    if-nez v1, :cond_2

    const/4 v1, 0x1

    sput-boolean v1, Lcom/eta/voicebridge/Asr;->toasted:Z

    const-string v1, "\u8c46\u5305\u8bc6\u522b\u6210\u529f\uff0c\u6d41\u5f0f\u8f93\u51fa\u4e2d"

    invoke-static {v1}, Lcom/eta/voicebridge/Ime;->toast(Ljava/lang/String;)V

    :cond_2
    sget-boolean v1, Lcom/eta/voicebridge/Asr;->capturing:Z

    if-eqz v1, :cond_4

    invoke-static {v0}, Lcom/eta/voicebridge/Ime;->onUpdate(Ljava/lang/String;)V

    goto :goto_1

    :cond_3
    const/16 v0, 0xf

    if-ne v6, v0, :cond_4

    const-string v0, "VoiceBridge/Asr"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "server error: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/eta/voicebridge/L;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_4
    :goto_1
    return-void

    :catch_0
    move-exception v0

    const-string v1, "VoiceBridge/Asr"

    const-string v2, "frame parse failed"

    invoke-static {v1, v2, v0}, Lcom/eta/voicebridge/L;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static onText(Ljava/lang/String;Z)V
    .locals 2

    :try_start_0
    sput-object p0, Lcom/eta/voicebridge/Asr;->text:Ljava/lang/String;

    sget-boolean v0, Lcom/eta/voicebridge/Asr;->toasted:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    sput-boolean v0, Lcom/eta/voicebridge/Asr;->toasted:Z

    const-string v0, "\u8bc6\u522b\u6210\u529f\uff0c\u6d41\u5f0f\u8f93\u51fa\u4e2d"

    invoke-static {v0}, Lcom/eta/voicebridge/Ime;->toast(Ljava/lang/String;)V

    :cond_0
    if-eqz p1, :cond_1

    invoke-static {p0}, Lcom/eta/voicebridge/Ime;->onFinal(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    sget-boolean v0, Lcom/eta/voicebridge/Asr;->capturing:Z

    if-eqz v0, :cond_2

    invoke-static {p0}, Lcom/eta/voicebridge/Ime;->onUpdate(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v1, "VoiceBridge/Asr"

    invoke-static {v1, v1, v0}, Lcom/eta/voicebridge/L;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static resample([B)[B
    .locals 12

    array-length v0, p0

    shr-int/lit8 v1, v0, 0x1

    if-lez v1, :cond_2

    sget v2, Lcom/eta/voicebridge/Asr;->sampleRate:I

    if-lez v2, :cond_2

    div-int v3, v1, v2

    mul-int/lit16 v3, v3, 0x3e80

    rem-int v4, v1, v2

    mul-int/lit16 v4, v4, 0x3e80

    div-int/2addr v4, v2

    add-int/2addr v3, v4

    if-lez v3, :cond_2

    mul-int/lit8 v4, v3, 0x2

    new-array v4, v4, [B

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_0
    if-ge v5, v3, :cond_1

    if-ge v6, v1, :cond_1

    mul-int/lit8 v8, v6, 0x2

    mul-int/lit8 v9, v5, 0x2

    aget-byte v10, p0, v8

    aput-byte v10, v4, v9

    add-int/lit8 v8, v8, 0x1

    add-int/lit8 v9, v9, 0x1

    aget-byte v10, p0, v8

    aput-byte v10, v4, v9

    add-int/lit8 v5, v5, 0x1

    add-int/lit16 v7, v7, 0x3e80

    :goto_1
    if-ge v7, v2, :cond_0

    goto :goto_0

    :cond_0
    sub-int/2addr v7, v2

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_1
    return-object v4

    :cond_2
    return-object p0
.end method

.method public static start(II)V
    .locals 5

    sget-boolean v0, Lcom/eta/voicebridge/Asr;->capturing:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    sput p0, Lcom/eta/voicebridge/Asr;->sampleRate:I

    const/4 v0, 0x0

    sput-object v0, Lcom/eta/voicebridge/Asr;->text:Ljava/lang/String;

    sput-boolean v0, Lcom/eta/voicebridge/Asr;->toasted:Z

    const/4 v0, 0x0

    sput-boolean v0, Lcom/eta/voicebridge/Asr;->isFinal:Z

    const/4 v0, 0x1

    sput-boolean v0, Lcom/eta/voicebridge/Asr;->capturing:Z

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    sput-wide v2, Lcom/eta/voicebridge/Asr;->startTime:J

    sput v0, Lcom/eta/voicebridge/Asr;->seq:I

    const/4 v0, 0x0

    sput v0, Lcom/eta/voicebridge/Asr;->pendingLen:I

    sget-object v0, Lcom/eta/voicebridge/Asr;->outbox:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V

    :try_start_0
    invoke-static {}, Lcom/eta/voicebridge/Config;->reload()V

    invoke-static {}, Lcom/eta/voicebridge/Segs;->reset()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "VoiceBridge/Asr"

    const-string v2, "config init failed, using defaults"

    invoke-static {v1, v2, v0}, Lcom/eta/voicebridge/L;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    const-string v0, "VoiceBridge/Asr"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "session start: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "Hz ch="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/lang/Thread;

    :try_start_1
    sget-object v1, Lcom/eta/voicebridge/Config;->provider:Ljava/lang/String;

    const-string v2, "qwen"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v1, Lcom/eta/voicebridge/ProvQwen;

    invoke-direct {v1}, Lcom/eta/voicebridge/ProvQwen;-><init>()V

    goto :goto_1

    :cond_1
    sget-object v1, Lcom/eta/voicebridge/Config;->provider:Ljava/lang/String;

    const-string v2, "iflytek"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    new-instance v1, Lcom/eta/voicebridge/ProvIflytek;

    invoke-direct {v1}, Lcom/eta/voicebridge/ProvIflytek;-><init>()V

    goto :goto_1

    :cond_2
    sget-object v1, Lcom/eta/voicebridge/Config;->provider:Ljava/lang/String;

    const-string v2, "openai"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    new-instance v1, Lcom/eta/voicebridge/ProvOpenai;

    invoke-direct {v1}, Lcom/eta/voicebridge/ProvOpenai;-><init>()V

    goto :goto_1

    :cond_3
    new-instance v1, Lcom/eta/voicebridge/Conn;

    invoke-direct {v1}, Lcom/eta/voicebridge/Conn;-><init>()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v1

    const-string v2, "VoiceBridge/Asr"

    const-string v3, "provider init failed, falling back to doubao"

    invoke-static {v2, v3, v1}, Lcom/eta/voicebridge/L;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance v1, Lcom/eta/voicebridge/Conn;

    invoke-direct {v1}, Lcom/eta/voicebridge/Conn;-><init>()V

    :goto_1
    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    const-string v1, "asr-conn"

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/eta/voicebridge/FakeReady;

    invoke-direct {v1}, Lcom/eta/voicebridge/FakeReady;-><init>()V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    const-string v1, "doubao-ready"

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/eta/voicebridge/Capture;

    invoke-direct {v1}, Lcom/eta/voicebridge/Capture;-><init>()V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    const-string v1, "doubao-capture"

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public static stop()V
    .locals 4

    :try_start_0
    sget-boolean v0, Lcom/eta/voicebridge/Asr;->capturing:Z

    if-eqz v0, :cond_1

    sget v0, Lcom/eta/voicebridge/Asr;->pendingLen:I

    if-lez v0, :cond_0

    new-array v1, v0, [B

    sget-object v2, Lcom/eta/voicebridge/Asr;->pending:[B

    const/4 v3, 0x0

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    sput v3, Lcom/eta/voicebridge/Asr;->pendingLen:I

    sget-object v0, Lcom/eta/voicebridge/Asr;->outbox:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z

    :cond_0
    const/4 v0, 0x0

    sput-boolean v0, Lcom/eta/voicebridge/Asr;->capturing:Z

    sget-object v0, Lcom/eta/voicebridge/Asr;->outbox:Ljava/util/concurrent/LinkedBlockingQueue;

    const/4 v1, 0x0

    new-array v1, v1, [B

    invoke-virtual {v0, v1}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z

    invoke-static {}, Lcom/eta/voicebridge/Ime;->finish()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    return-void

    :catch_0
    move-exception v0

    const-string v1, "VoiceBridge/Asr"

    const-string v2, "stop failed"

    invoke-static {v1, v2, v0}, Lcom/eta/voicebridge/L;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static text()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/eta/voicebridge/Asr;->text:Ljava/lang/String;

    return-object v0
.end method

.method public static toggle()V
    .locals 2

    sget-boolean v0, Lcom/eta/voicebridge/Asr;->capturing:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/eta/voicebridge/Asr;->stop()V

    return-void

    :cond_0
    const/16 v0, 0x3e80

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/eta/voicebridge/Asr;->start(II)V

    return-void
.end method
