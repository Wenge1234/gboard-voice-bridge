.class public final Lcom/eta/voicebridge/Conn;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static headers()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "X-Api-Key: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/eta/voicebridge/Config;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\r\nX-Api-Resource-Id: volc.seedasr.sauc.duration\r\nX-Api-Request-Id: 67ee89ba-7050-4c04-a3d7-ac61a63499b3\r\nX-Api-Connect-Id: 67ee89ba-7050-4c04-a3d7-ac61a63499b4\r\nX-Api-Sequence: -1\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 8

    :try_start_0
    new-instance v0, Lcom/eta/voicebridge/Ws;

    const-string v1, "openspeech.bytedance.com"

    const-string v2, "/api/v3/sauc/bigmodel_async"

    invoke-static {}, Lcom/eta/voicebridge/Conn;->headers()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/eta/voicebridge/Ws;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/eta/voicebridge/Ws;->connect()V

    sput-object v0, Lcom/eta/voicebridge/Asr;->ws:Lcom/eta/voicebridge/Ws;

    const-string v1, "{\"user\":{\"uid\":\"eta-gboard-bridge\",\"platform\":\"Android\",\"app_version\":\"0.1\"},\"audio\":{\"format\":\"pcm\",\"codec\":\"raw\",\"rate\":16000,\"bits\":16,\"channel\":1},\"request\":{\"model_name\":\"bigmodel\",\"enable_itn\":true,\"enable_punc\":true,\"show_utterances\":true,\"result_type\":\"full\"}}"

    const-string v2, "UTF-8"

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    move-object v5, v1

    const/4 v1, 0x1

    const/16 v2, 0x10

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/eta/voicebridge/Ws;->send(IIII[B)V

    new-instance v5, Ljava/lang/Thread;

    new-instance v6, Lcom/eta/voicebridge/Sender;

    invoke-direct {v6, v0}, Lcom/eta/voicebridge/Sender;-><init>(Lcom/eta/voicebridge/Ws;)V

    invoke-direct {v5, v6}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    const-string v6, "doubao-send"

    invoke-virtual {v5, v6}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/Thread;->setDaemon(Z)V

    invoke-virtual {v5}, Ljava/lang/Thread;->start()V

    invoke-virtual {v0}, Lcom/eta/voicebridge/Ws;->readLoop()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "VoiceBridge/Asr"

    const-string v2, "conn failed"

    invoke-static {v1, v2, v0}, Lcom/eta/voicebridge/L;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    const/4 v0, 0x0

    sput-object v0, Lcom/eta/voicebridge/Asr;->ws:Lcom/eta/voicebridge/Ws;

    return-void
.end method
