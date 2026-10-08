.class public final Lcom/eta/voicebridge/Ws;
.super Ljava/lang/Object;


# static fields
.field private static final rng:Ljava/security/SecureRandom;


# instance fields
.field public extra:Ljava/lang/String;

.field private host:Ljava/lang/String;

.field private in:Ljava/io/InputStream;

.field private out:Ljava/io/OutputStream;

.field private path:Ljava/lang/String;

.field private socket:Ljava/net/Socket;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    sput-object v0, Lcom/eta/voicebridge/Ws;->rng:Ljava/security/SecureRandom;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/eta/voicebridge/Ws;->host:Ljava/lang/String;

    iput-object p2, p0, Lcom/eta/voicebridge/Ws;->path:Ljava/lang/String;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/eta/voicebridge/Ws;->extra:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/eta/voicebridge/Ws;->host:Ljava/lang/String;

    iput-object p2, p0, Lcom/eta/voicebridge/Ws;->path:Ljava/lang/String;

    iput-object p3, p0, Lcom/eta/voicebridge/Ws;->extra:Ljava/lang/String;

    return-void
.end method

.method private readFully([B)V
    .locals 5

    const/4 v0, 0x0

    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/eta/voicebridge/Ws;->in:Ljava/io/InputStream;

    array-length v2, p1

    sub-int/2addr v2, v0

    invoke-virtual {v1, p1, v0, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    if-gez v1, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "eof"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    add-int/2addr v0, v1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private readLine()Ljava/lang/String;
    .locals 4

    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/eta/voicebridge/Ws;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v1

    if-gez v1, :cond_1

    goto :goto_1

    :cond_1
    const/16 v2, 0xa

    if-ne v1, v2, :cond_2

    :goto_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v1

    if-gtz v1, :cond_3

    const/4 v1, 0x0

    return-object v1

    :cond_2
    const/16 v2, 0xd

    if-eq v1, v2, :cond_0

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_0

    :cond_3
    new-instance v1, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    const-string v3, "UTF-8"

    invoke-direct {v1, v2, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v1
.end method

.method private sendFrame(I[B)V
    .locals 9

    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    or-int/lit16 v1, p1, 0x80

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    array-length v2, p2

    const/16 v3, 0x7e

    if-ge v2, v3, :cond_0

    or-int/lit16 v1, v2, 0x80

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_1

    :cond_0
    const v3, 0xffff

    if-ge v2, v3, :cond_1

    const/16 v1, 0xfe

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    shr-int/lit8 v1, v2, 0x8

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    and-int/lit16 v1, v2, 0xff

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_1

    :cond_1
    const/16 v1, 0xff

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    const/4 v3, 0x7

    :goto_0
    if-ltz v3, :cond_2

    mul-int/lit8 v1, v3, 0x8

    ushr-int v4, v2, v1

    and-int/lit16 v4, v4, 0xff

    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    :cond_2
    :goto_1
    const/4 v1, 0x4

    new-array v1, v1, [B

    sget-object v3, Lcom/eta/voicebridge/Ws;->rng:Ljava/security/SecureRandom;

    invoke-virtual {v3, v1}, Ljava/security/SecureRandom;->nextBytes([B)V

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write([B)V

    new-array v3, v2, [B

    const/4 v4, 0x0

    :goto_2
    if-ge v4, v2, :cond_3

    aget-byte v5, p2, v4

    and-int/lit8 v6, v4, 0x3

    aget-byte v6, v1, v6

    xor-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v3, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :cond_3
    invoke-virtual {v0, v3}, Ljava/io/ByteArrayOutputStream;->write([B)V

    iget-object v1, p0, Lcom/eta/voicebridge/Ws;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    iget-object v0, p0, Lcom/eta/voicebridge/Ws;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "ws send failed"

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public close()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/eta/voicebridge/Ws;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception v0

    return-void
.end method

.method public connect()V
    .locals 8

    invoke-static {}, Ljavax/net/ssl/SSLSocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v0

    iget-object v1, p0, Lcom/eta/voicebridge/Ws;->host:Ljava/lang/String;

    const/16 v2, 0x1bb

    invoke-virtual {v0, v1, v2}, Ljavax/net/SocketFactory;->createSocket(Ljava/lang/String;I)Ljava/net/Socket;

    move-result-object v0

    iput-object v0, p0, Lcom/eta/voicebridge/Ws;->socket:Ljava/net/Socket;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    iget-object v0, p0, Lcom/eta/voicebridge/Ws;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lcom/eta/voicebridge/Ws;->in:Ljava/io/InputStream;

    iget-object v0, p0, Lcom/eta/voicebridge/Ws;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    iput-object v0, p0, Lcom/eta/voicebridge/Ws;->out:Ljava/io/OutputStream;

    const/16 v0, 0x10

    new-array v0, v0, [B

    sget-object v1, Lcom/eta/voicebridge/Ws;->rng:Ljava/security/SecureRandom;

    invoke-virtual {v1, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    invoke-static {}, Ljava/util/Base64;->getEncoder()Ljava/util/Base64$Encoder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/Base64$Encoder;->encodeToString([B)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "GET "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/eta/voicebridge/Ws;->path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " HTTP/1.1\r\nHost: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/eta/voicebridge/Ws;->host:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Key: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\r\nSec-WebSocket-Version: 13\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/eta/voicebridge/Ws;->extra:Ljava/lang/String;

    if-eqz v2, :cond_0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    const-string v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/eta/voicebridge/Ws;->out:Ljava/io/OutputStream;

    const-string v3, "UTF-8"

    invoke-virtual {v1, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/io/OutputStream;->write([B)V

    iget-object v1, p0, Lcom/eta/voicebridge/Ws;->out:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V

    invoke-direct {p0}, Lcom/eta/voicebridge/Ws;->readLine()Ljava/lang/String;

    move-result-object v0

    const-string v1, "VoiceBridge/Ws"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handshake: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "no handshake response"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const-string v1, "101"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    :goto_0
    invoke-direct {p0}, Lcom/eta/voicebridge/Ws;->readLine()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_0

    :cond_2
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handshake rejected: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_3
    return-void
.end method

.method public readLoop()V
    .locals 10

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/eta/voicebridge/Ws;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    if-gez v0, :cond_1

    return-void

    :cond_1
    const-string v1, "VoiceBridge/Ws"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "recv b0="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V

    and-int/lit8 v6, v0, 0xf

    iget-object v0, p0, Lcom/eta/voicebridge/Ws;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    and-int/lit16 v7, v0, 0x80

    and-int/lit8 v5, v0, 0x7f

    const/16 v1, 0x7e

    if-ne v5, v1, :cond_2

    iget-object v0, p0, Lcom/eta/voicebridge/Ws;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    shl-int/lit8 v0, v0, 0x8

    iget-object v1, p0, Lcom/eta/voicebridge/Ws;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v1

    or-int v5, v0, v1

    goto :goto_2

    :cond_2
    const/16 v1, 0x7f

    if-ne v5, v1, :cond_3

    const/4 v5, 0x0

    const/4 v2, 0x0

    :goto_1
    const/16 v1, 0x8

    if-ge v2, v1, :cond_3

    shl-int/lit8 v5, v5, 0x8

    iget-object v0, p0, Lcom/eta/voicebridge/Ws;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    or-int/2addr v5, v0

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_3
    :goto_2
    if-eqz v7, :cond_4

    const/4 v0, 0x4

    new-array v0, v0, [B

    invoke-direct {p0, v0}, Lcom/eta/voicebridge/Ws;->readFully([B)V

    goto :goto_3

    :cond_4
    const/4 v0, 0x0

    :goto_3
    new-array v1, v5, [B

    invoke-direct {p0, v1}, Lcom/eta/voicebridge/Ws;->readFully([B)V

    if-eqz v0, :cond_5

    const/4 v2, 0x0

    :goto_4
    array-length v3, v1

    if-ge v2, v3, :cond_5

    aget-byte v3, v1, v2

    and-int/lit8 v4, v2, 0x3

    aget-byte v4, v0, v4

    xor-int/2addr v3, v4

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_5
    const/16 v2, 0x8

    if-ne v6, v2, :cond_6

    return-void

    :cond_6
    const/4 v2, 0x2

    if-ne v6, v2, :cond_0

    const-string v2, "VoiceBridge/Ws"

    const-string v3, "dispatch -> onServerFrame"

    invoke-static {v2, v3}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v1}, Lcom/eta/voicebridge/Asr;->onServerFrame([B)V

    goto/16 :goto_0
.end method

.method public readMessage()Ljava/lang/String;
    .locals 7

    :goto_0
    :try_start_0
    const/4 v0, 0x2

    new-array v0, v0, [B

    invoke-direct {p0, v0}, Lcom/eta/voicebridge/Ws;->readFully([B)V

    const/4 v1, 0x0

    aget-byte v1, v0, v1

    and-int/lit8 v1, v1, 0xf

    const/4 v2, 0x1

    aget-byte v0, v0, v2

    and-int/lit16 v2, v0, 0x7f

    const/16 v3, 0x7e

    if-ne v2, v3, :cond_0

    const/4 v3, 0x2

    new-array v3, v3, [B

    invoke-direct {p0, v3}, Lcom/eta/voicebridge/Ws;->readFully([B)V

    const/4 v2, 0x0

    aget-byte v2, v3, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    const/4 v4, 0x1

    aget-byte v3, v3, v4

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v2, v3

    goto :goto_1

    :cond_0
    const/16 v3, 0x7f

    if-ne v2, v3, :cond_1

    const/16 v3, 0x8

    new-array v3, v3, [B

    invoke-direct {p0, v3}, Lcom/eta/voicebridge/Ws;->readFully([B)V

    const/4 v2, 0x4

    aget-byte v2, v3, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x18

    const/4 v4, 0x5

    aget-byte v4, v3, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x10

    or-int/2addr v2, v4

    const/4 v4, 0x6

    aget-byte v4, v3, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x8

    or-int/2addr v2, v4

    const/4 v4, 0x7

    aget-byte v3, v3, v4

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v2, v3

    :cond_1
    :goto_1
    new-array v3, v2, [B

    invoke-direct {p0, v3}, Lcom/eta/voicebridge/Ws;->readFully([B)V

    const/16 v4, 0x8

    if-ne v1, v4, :cond_2

    const/4 v0, 0x0

    return-object v0

    :cond_2
    const/16 v4, 0x9

    if-ne v1, v4, :cond_3

    const/16 v4, 0xa

    invoke-direct {p0, v4, v3}, Lcom/eta/voicebridge/Ws;->sendFrame(I[B)V

    goto :goto_0

    :cond_3
    const/16 v4, 0xa

    if-ne v1, v4, :cond_4

    goto :goto_0

    :cond_4
    new-instance v0, Ljava/lang/String;

    const-string v4, "UTF-8"

    invoke-direct {v0, v3, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    return-object v0
.end method

.method public declared-synchronized send(IIII[B)V
    .locals 13

    move-object/from16 v12, p5

    const-string v0, "VoiceBridge/Ws"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "send b1="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " flags="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v2, p3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " len="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v2, v12

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V

    array-length v0, v12

    add-int/lit8 v6, v0, 0x8

    const/4 v0, 0x1

    move/from16 v1, p3

    if-eq v1, v0, :cond_0

    const/4 v0, 0x3

    if-ne v1, v0, :cond_1

    :cond_0
    add-int/lit8 v6, v6, 0x4

    :cond_1
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v0, 0x82

    invoke-virtual {v2, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    const/16 v0, 0x7e

    if-ge v6, v0, :cond_2

    or-int/lit16 v0, v6, 0x80

    invoke-virtual {v2, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_1

    :cond_2
    const v0, 0xffff

    if-ge v6, v0, :cond_3

    const/16 v0, 0xfe

    invoke-virtual {v2, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    shr-int/lit8 v0, v6, 0x8

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {v2, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    and-int/lit16 v0, v6, 0xff

    invoke-virtual {v2, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_1

    :cond_3
    const/16 v0, 0xff

    invoke-virtual {v2, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    const/4 v3, 0x7

    :goto_0
    if-ltz v3, :cond_4

    mul-int/lit8 v0, v3, 0x8

    ushr-int v4, v6, v0

    and-int/lit16 v4, v4, 0xff

    invoke-virtual {v2, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    :cond_4
    :goto_1
    const/4 v0, 0x4

    new-array v7, v0, [B

    sget-object v0, Lcom/eta/voicebridge/Ws;->rng:Ljava/security/SecureRandom;

    invoke-virtual {v0, v7}, Ljava/security/SecureRandom;->nextBytes([B)V

    const/4 v0, 0x0

    :goto_2
    const/4 v3, 0x4

    if-ge v0, v3, :cond_5

    aget-byte v3, v7, v0

    invoke-virtual {v2, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_5
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v10

    const/16 v0, 0x11

    invoke-virtual {v2, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    shl-int/lit8 v0, p1, 0x4

    or-int v0, v0, p3

    invoke-virtual {v2, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    invoke-virtual {v2, p2}, Ljava/io/ByteArrayOutputStream;->write(I)V

    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    const/4 v0, 0x1

    move/from16 v1, p3

    if-eq v1, v0, :cond_6

    const/4 v0, 0x3

    if-ne v1, v0, :cond_7

    :cond_6
    move/from16 v11, p4

    shr-int/lit8 v0, v11, 0x18

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {v2, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    shr-int/lit8 v0, v11, 0x10

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {v2, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    shr-int/lit8 v0, v11, 0x8

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {v2, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    and-int/lit16 v0, v11, 0xff

    invoke-virtual {v2, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    :cond_7
    array-length v0, v12

    shr-int/lit8 v3, v0, 0x18

    and-int/lit16 v3, v3, 0xff

    invoke-virtual {v2, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    shr-int/lit8 v3, v0, 0x10

    and-int/lit16 v3, v3, 0xff

    invoke-virtual {v2, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    shr-int/lit8 v3, v0, 0x8

    and-int/lit16 v3, v3, 0xff

    invoke-virtual {v2, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {v2, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    invoke-virtual {v2, v12}, Ljava/io/ByteArrayOutputStream;->write([B)V

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    move v3, v10

    :goto_3
    array-length v4, v0

    if-ge v3, v4, :cond_8

    aget-byte v4, v0, v3

    sub-int v5, v3, v10

    and-int/lit8 v5, v5, 0x3

    aget-byte v5, v7, v5

    xor-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v0, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_8
    iget-object v3, p0, Lcom/eta/voicebridge/Ws;->out:Ljava/io/OutputStream;

    invoke-virtual {v3, v0}, Ljava/io/OutputStream;->write([B)V

    iget-object v0, p0, Lcom/eta/voicebridge/Ws;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    return-void
.end method

.method public sendBin([B)V
    .locals 2

    const/4 v0, 0x2

    invoke-direct {p0, v0, p1}, Lcom/eta/voicebridge/Ws;->sendFrame(I[B)V

    return-void
.end method

.method public sendText(Ljava/lang/String;)V
    .locals 3

    const-string v0, "UTF-8"

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, v1, v0}, Lcom/eta/voicebridge/Ws;->sendFrame(I[B)V

    return-void
.end method
