.class public final Lcom/eta/voicebridge/IflytekSend;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final ws:Lcom/eta/voicebridge/Ws;


# direct methods
.method public constructor <init>(Lcom/eta/voicebridge/Ws;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/eta/voicebridge/IflytekSend;->ws:Lcom/eta/voicebridge/Ws;

    return-void
.end method

.method private frame(IZLjava/lang/String;)Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p2, :cond_1

    const-string v1, "{\"common\":{\"app_id\":\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/eta/voicebridge/Config;->appId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\"},\"business\":{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/eta/voicebridge/Config;->lang:Ljava/lang/String;

    const-string v2, "zh"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "\"language\":\"zh_cn\",\"domain\":\"iat\",\"accent\":\"mandarin\",\"vad_eos\":10000"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    const-string v1, "\"language\":\"en_us\",\"domain\":\"iat\",\"vad_eos\":10000"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    const-string v1, "},\"data\":{\"status\":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_2
    const-string v1, "{\"data\":{\"status\":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_1
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ",\"format\":\"audio/L16;rate=16000\",\"encoding\":\"raw\",\"audio\":\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\"}}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 10

    :try_start_0
    const/4 v0, 0x1

    :cond_0
    sget-object v1, Lcom/eta/voicebridge/Asr;->outbox:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    array-length v2, v1

    if-gtz v2, :cond_1

    iget-object v1, p0, Lcom/eta/voicebridge/IflytekSend;->ws:Lcom/eta/voicebridge/Ws;

    const/4 v2, 0x2

    const/4 v3, 0x0

    const-string v4, ""

    invoke-direct {p0, v2, v3, v4}, Lcom/eta/voicebridge/IflytekSend;->frame(IZLjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/eta/voicebridge/Ws;->sendText(Ljava/lang/String;)V

    goto :goto_2

    :cond_1
    const/4 v2, 0x0

    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_0

    array-length v3, v1

    sub-int/2addr v3, v2

    const/16 v4, 0x500

    if-le v3, v4, :cond_2

    const/16 v3, 0x500

    :cond_2
    new-array v5, v3, [B

    const/4 v6, 0x0

    invoke-static {v1, v2, v5, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-static {}, Ljava/util/Base64;->getEncoder()Ljava/util/Base64$Encoder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/util/Base64$Encoder;->encodeToString([B)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/eta/voicebridge/IflytekSend;->ws:Lcom/eta/voicebridge/Ws;

    const/4 v7, 0x1

    if-eqz v0, :cond_3

    const/4 v8, 0x0

    goto :goto_1

    :cond_3
    const/4 v8, 0x1

    :goto_1
    invoke-direct {p0, v8, v0, v5}, Lcom/eta/voicebridge/IflytekSend;->frame(IZLjava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Lcom/eta/voicebridge/Ws;->sendText(Ljava/lang/String;)V

    const/4 v0, 0x0

    add-int/2addr v2, v3

    const-wide/16 v5, 0x23

    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V

    goto :goto_0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_2
    return-void

    :catch_0
    move-exception v0

    const-string v1, "VoiceBridge/Iflytek"

    const-string v2, "send loop ended"

    invoke-static {v1, v2, v0}, Lcom/eta/voicebridge/L;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
