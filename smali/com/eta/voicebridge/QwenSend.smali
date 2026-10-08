.class public final Lcom/eta/voicebridge/QwenSend;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final tid:Ljava/lang/String;

.field private final ws:Lcom/eta/voicebridge/Ws;


# direct methods
.method public constructor <init>(Lcom/eta/voicebridge/Ws;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/eta/voicebridge/QwenSend;->ws:Lcom/eta/voicebridge/Ws;

    iput-object p2, p0, Lcom/eta/voicebridge/QwenSend;->tid:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    :goto_0
    :try_start_0
    sget-object v0, Lcom/eta/voicebridge/Asr;->outbox:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    array-length v1, v0

    if-gtz v1, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{\"header\":{\"action\":\"finish-task\",\"task_id\":\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/eta/voicebridge/QwenSend;->tid:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\",\"streaming\":\"duplex\"},\"payload\":{\"input\":{}}}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/eta/voicebridge/QwenSend;->ws:Lcom/eta/voicebridge/Ws;

    invoke-virtual {v1, v0}, Lcom/eta/voicebridge/Ws;->sendText(Ljava/lang/String;)V

    goto :goto_1

    :cond_0
    iget-object v1, p0, Lcom/eta/voicebridge/QwenSend;->ws:Lcom/eta/voicebridge/Ws;

    invoke-virtual {v1, v0}, Lcom/eta/voicebridge/Ws;->sendBin([B)V

    goto :goto_0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    return-void

    :catch_0
    move-exception v0

    const-string v1, "VoiceBridge/Qwen"

    const-string v2, "send loop ended"

    invoke-static {v1, v2, v0}, Lcom/eta/voicebridge/L;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
