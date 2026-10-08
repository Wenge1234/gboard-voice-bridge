.class public final Lcom/eta/voicebridge/Sender;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final ws:Lcom/eta/voicebridge/Ws;


# direct methods
.method public constructor <init>(Lcom/eta/voicebridge/Ws;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/eta/voicebridge/Sender;->ws:Lcom/eta/voicebridge/Ws;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    :goto_0
    :try_start_0
    sget-object v0, Lcom/eta/voicebridge/Asr;->outbox:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    array-length v1, v0

    if-lez v1, :cond_0

    iget-object v1, p0, Lcom/eta/voicebridge/Sender;->ws:Lcom/eta/voicebridge/Ws;

    move-object v6, v0

    move-object v0, v1

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    sget v4, Lcom/eta/voicebridge/Asr;->seq:I

    move-object v5, v6

    invoke-virtual/range {v0 .. v5}, Lcom/eta/voicebridge/Ws;->send(IIII[B)V

    sget v0, Lcom/eta/voicebridge/Asr;->seq:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/eta/voicebridge/Asr;->seq:I

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/eta/voicebridge/Sender;->ws:Lcom/eta/voicebridge/Ws;

    const/4 v2, 0x0

    new-array v6, v2, [B

    move-object v0, v1

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    move-object v5, v6

    invoke-virtual/range {v0 .. v5}, Lcom/eta/voicebridge/Ws;->send(IIII[B)V

    const/4 v0, 0x1

    sput-boolean v0, Lcom/eta/voicebridge/Asr;->isFinal:Z

    const-string v0, "VoiceBridge/Asr"

    const-string v1, "last packet sent, final pending"

    invoke-static {v0, v1}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    const-string v1, "VoiceBridge/Asr"

    const-string v2, "sender failed"

    invoke-static {v1, v2, v0}, Lcom/eta/voicebridge/L;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
