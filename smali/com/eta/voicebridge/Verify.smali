.class public final Lcom/eta/voicebridge/Verify;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static check(Ljava/lang/String;)V
    .locals 3

    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ok "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 5

    :try_start_0
    const-string v0, "com.eta.voicebridge.Config"

    invoke-static {v0}, Lcom/eta/voicebridge/Verify;->check(Ljava/lang/String;)V

    const-string v0, "com.eta.voicebridge.Segs"

    invoke-static {v0}, Lcom/eta/voicebridge/Verify;->check(Ljava/lang/String;)V

    const-string v0, "com.eta.voicebridge.Ws"

    invoke-static {v0}, Lcom/eta/voicebridge/Verify;->check(Ljava/lang/String;)V

    const-string v0, "com.eta.voicebridge.Conn"

    invoke-static {v0}, Lcom/eta/voicebridge/Verify;->check(Ljava/lang/String;)V

    const-string v0, "com.eta.voicebridge.Sender"

    invoke-static {v0}, Lcom/eta/voicebridge/Verify;->check(Ljava/lang/String;)V

    const-string v0, "com.eta.voicebridge.Asr"

    invoke-static {v0}, Lcom/eta/voicebridge/Verify;->check(Ljava/lang/String;)V

    const-string v0, "com.eta.voicebridge.Ime"

    invoke-static {v0}, Lcom/eta/voicebridge/Verify;->check(Ljava/lang/String;)V

    const-string v0, "com.eta.voicebridge.QwenSend"

    invoke-static {v0}, Lcom/eta/voicebridge/Verify;->check(Ljava/lang/String;)V

    const-string v0, "com.eta.voicebridge.ProvQwen"

    invoke-static {v0}, Lcom/eta/voicebridge/Verify;->check(Ljava/lang/String;)V

    const-string v0, "com.eta.voicebridge.IflytekSend"

    invoke-static {v0}, Lcom/eta/voicebridge/Verify;->check(Ljava/lang/String;)V

    const-string v0, "com.eta.voicebridge.ProvIflytek"

    invoke-static {v0}, Lcom/eta/voicebridge/Verify;->check(Ljava/lang/String;)V

    const-string v0, "com.eta.voicebridge.ProvOpenai"

    invoke-static {v0}, Lcom/eta/voicebridge/Verify;->check(Ljava/lang/String;)V

    const-string v0, "com.eta.voicebridge.SettingsActivity"

    invoke-static {v0}, Lcom/eta/voicebridge/Verify;->check(Ljava/lang/String;)V

    const-string v0, "com.eta.voicebridge.HookEntry"

    invoke-static {v0}, Lcom/eta/voicebridge/Verify;->check(Ljava/lang/String;)V

    const-string v0, "com.eta.voicebridge.HookKill"

    invoke-static {v0}, Lcom/eta/voicebridge/Verify;->check(Ljava/lang/String;)V

    invoke-static {}, Lcom/eta/voicebridge/Config;->reload()V

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "ok Config.reload"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    invoke-static {}, Lcom/eta/voicebridge/Segs;->reset()V

    const/4 v0, 0x1

    const-string v1, "hello"

    invoke-static {v0, v1}, Lcom/eta/voicebridge/Segs;->add(ILjava/lang/String;)V

    invoke-static {}, Lcom/eta/voicebridge/Segs;->text()Ljava/lang/String;

    move-result-object v0

    const-string v1, "hello"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "ok Segs roundtrip"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    const/16 v0, 0x64

    new-array v0, v0, [B

    invoke-static {v0}, Lcom/eta/voicebridge/ProvOpenai;->wav([B)[B

    move-result-object v0

    array-length v0, v0

    const/16 v1, 0x90

    if-ne v0, v1, :cond_1

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "ok wav size"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "VERIFY ALL OK"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void

    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Segs roundtrip mismatch"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "wav size mismatch"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "VERIFY FAILED"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    return-void
.end method
