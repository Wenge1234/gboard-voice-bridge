.class public final Lcom/eta/voicebridge/Scan;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final root:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/eta/voicebridge/Scan;->root:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/eta/voicebridge/Scan;->root:Landroid/view/View;

    invoke-static {v0}, Lcom/eta/voicebridge/Find;->takeAll(Landroid/view/View;)V

    iget-object v0, p0, Lcom/eta/voicebridge/Scan;->root:Landroid/view/View;

    invoke-static {v0}, Lcom/eta/voicebridge/Find;->dump(Landroid/view/View;)V

    sget-object v0, Lcom/eta/voicebridge/Find;->micView:Landroid/view/View;

    if-eqz v0, :cond_0

    const-string v0, "VoiceBridge/Find"

    const-string v1, "scan done: mic LOCATED"

    invoke-static {v0, v1}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string v0, "VoiceBridge/Find"

    const-string v1, "scan done: mic NOT found"

    invoke-static {v0, v1}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    return-void
.end method
