.class public final Lcom/eta/voicebridge/Ime;
.super Ljava/lang/Object;


# static fields
.field public static ime:Landroid/inputmethodservice/InputMethodService;

.field private static lastText:Ljava/lang/String;

.field private static sentLen:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static finish()V
    .locals 3

    :try_start_0
    sget-object v0, Lcom/eta/voicebridge/Ime;->ime:Landroid/inputmethodservice/InputMethodService;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/inputmethodservice/InputMethodService;->getCurrentInputConnection()Landroid/view/inputmethod/InputConnection;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroid/view/inputmethod/InputConnection;->finishComposingText()Z

    :cond_0
    const/4 v0, 0x0

    sput v0, Lcom/eta/voicebridge/Ime;->sentLen:I

    const/4 v0, 0x0

    sput-object v0, Lcom/eta/voicebridge/Ime;->lastText:Ljava/lang/String;

    const-string v0, "VoiceBridge/Ime"

    const-string v1, "dictation finished -> composing committed"

    invoke-static {v0, v1}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "\u5df2\u4e0a\u5c4f"

    invoke-static {v0}, Lcom/eta/voicebridge/Ime;->toast(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    return-void
.end method

.method public static onFinal(Ljava/lang/String;)V
    .locals 3

    :try_start_0
    sget-object v0, Lcom/eta/voicebridge/Ime;->ime:Landroid/inputmethodservice/InputMethodService;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/inputmethodservice/InputMethodService;->getCurrentInputConnection()Landroid/view/inputmethod/InputConnection;

    move-result-object v0

    if-eqz v0, :cond_2

    if-eqz p0, :cond_1

    sget v1, Lcom/eta/voicebridge/Ime;->sentLen:I

    if-lez v1, :cond_0

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/view/inputmethod/InputConnection;->deleteSurroundingText(II)Z

    :cond_0
    const/4 v1, 0x1

    invoke-interface {v0, p0, v1}, Landroid/view/inputmethod/InputConnection;->setComposingText(Ljava/lang/CharSequence;I)Z

    :cond_1
    invoke-interface {v0}, Landroid/view/inputmethod/InputConnection;->finishComposingText()Z

    :cond_2
    const/4 v0, 0x0

    sput v0, Lcom/eta/voicebridge/Ime;->sentLen:I

    const/4 v0, 0x0

    sput-object v0, Lcom/eta/voicebridge/Ime;->lastText:Ljava/lang/String;

    const-string v0, "VoiceBridge/Ime"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "committed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p0, :cond_3

    const-string v0, "\u5df2\u4e0a\u5c4f"

    invoke-static {v0}, Lcom/eta/voicebridge/Ime;->toast(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_3
    return-void

    :catch_0
    move-exception v0

    const-string v1, "VoiceBridge/Ime"

    const-string v2, "onFinal failed"

    invoke-static {v1, v2, v0}, Lcom/eta/voicebridge/L;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static onUpdate(Ljava/lang/String;)V
    .locals 3

    :try_start_0
    if-eqz p0, :cond_2

    sget-object v0, Lcom/eta/voicebridge/Ime;->lastText:Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    sput-object p0, Lcom/eta/voicebridge/Ime;->lastText:Ljava/lang/String;

    sget-object v0, Lcom/eta/voicebridge/Ime;->ime:Landroid/inputmethodservice/InputMethodService;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/inputmethodservice/InputMethodService;->getCurrentInputConnection()Landroid/view/inputmethod/InputConnection;

    move-result-object v0

    if-eqz v0, :cond_2

    sget v1, Lcom/eta/voicebridge/Ime;->sentLen:I

    if-lez v1, :cond_1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/view/inputmethod/InputConnection;->deleteSurroundingText(II)Z

    :cond_1
    const/4 v1, 0x1

    invoke-interface {v0, p0, v1}, Landroid/view/inputmethod/InputConnection;->setComposingText(Ljava/lang/CharSequence;I)Z

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    sput v1, Lcom/eta/voicebridge/Ime;->sentLen:I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    return-void

    :catch_0
    move-exception v0

    const-string v1, "VoiceBridge/Ime"

    const-string v2, "onUpdate failed"

    invoke-static {v1, v2, v0}, Lcom/eta/voicebridge/L;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static toast(Ljava/lang/String;)V
    .locals 3

    :try_start_0
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v0, Lcom/eta/voicebridge/ToastRun;

    invoke-direct {v0, p0}, Lcom/eta/voicebridge/ToastRun;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    return-void
.end method
