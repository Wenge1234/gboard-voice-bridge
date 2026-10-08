.class public final Lcom/eta/voicebridge/BtnTouch;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnTouchListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3

    :try_start_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const-string v0, "VoiceBridge"

    const-string v2, "mic TOUCH intercepted -> own dictation"

    invoke-static {v0, v2}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/eta/voicebridge/Asr;->toggle()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    return v0

    :catch_0
    move-exception v0

    const/4 v0, 0x1

    return v0
.end method
