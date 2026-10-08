.class public final Lcom/eta/voicebridge/Config;
.super Ljava/lang/Object;


# static fields
.field public static volatile appId:Ljava/lang/String;

.field public static volatile key:Ljava/lang/String;

.field public static volatile lang:Ljava/lang/String;

.field public static volatile model:Ljava/lang/String;

.field public static volatile provider:Ljava/lang/String;

.field public static volatile secret:Ljava/lang/String;

.field public static volatile url:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "doubao"

    sput-object v0, Lcom/eta/voicebridge/Config;->provider:Ljava/lang/String;

    const-string v0, ""

    sput-object v0, Lcom/eta/voicebridge/Config;->key:Ljava/lang/String;

    const-string v0, ""

    sput-object v0, Lcom/eta/voicebridge/Config;->secret:Ljava/lang/String;

    sput-object v0, Lcom/eta/voicebridge/Config;->appId:Ljava/lang/String;

    const-string v0, "https://api.openai.com/v1"

    sput-object v0, Lcom/eta/voicebridge/Config;->url:Ljava/lang/String;

    const-string v0, ""

    sput-object v0, Lcom/eta/voicebridge/Config;->model:Ljava/lang/String;

    const-string v0, "zh"

    sput-object v0, Lcom/eta/voicebridge/Config;->lang:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static pick(Lde/robv/android/xposed/XSharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    :try_start_0
    invoke-virtual {p0, p1, p2}, Lde/robv/android/xposed/XSharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_0

    return-object v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-object p2

    :catch_0
    move-exception v0

    return-object p2
.end method

.method public static reload()V
    .locals 5

    :try_start_0
    new-instance v0, Lde/robv/android/xposed/XSharedPreferences;

    const-string v1, "com.eta.voicebridge"

    const-string v2, "cfg"

    invoke-direct {v0, v1, v2}, Lde/robv/android/xposed/XSharedPreferences;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/eta/voicebridge/Config;->provider:Ljava/lang/String;

    const-string v2, "provider"

    invoke-static {v0, v2, v1}, Lcom/eta/voicebridge/Config;->pick(Lde/robv/android/xposed/XSharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/eta/voicebridge/Config;->provider:Ljava/lang/String;

    sget-object v1, Lcom/eta/voicebridge/Config;->key:Ljava/lang/String;

    const-string v2, "key"

    invoke-static {v0, v2, v1}, Lcom/eta/voicebridge/Config;->pick(Lde/robv/android/xposed/XSharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/eta/voicebridge/Config;->key:Ljava/lang/String;

    sget-object v1, Lcom/eta/voicebridge/Config;->secret:Ljava/lang/String;

    const-string v2, "secret"

    invoke-static {v0, v2, v1}, Lcom/eta/voicebridge/Config;->pick(Lde/robv/android/xposed/XSharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/eta/voicebridge/Config;->secret:Ljava/lang/String;

    sget-object v1, Lcom/eta/voicebridge/Config;->appId:Ljava/lang/String;

    const-string v2, "appid"

    invoke-static {v0, v2, v1}, Lcom/eta/voicebridge/Config;->pick(Lde/robv/android/xposed/XSharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/eta/voicebridge/Config;->appId:Ljava/lang/String;

    sget-object v1, Lcom/eta/voicebridge/Config;->url:Ljava/lang/String;

    const-string v2, "url"

    invoke-static {v0, v2, v1}, Lcom/eta/voicebridge/Config;->pick(Lde/robv/android/xposed/XSharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/eta/voicebridge/Config;->url:Ljava/lang/String;

    sget-object v1, Lcom/eta/voicebridge/Config;->model:Ljava/lang/String;

    const-string v2, "model"

    invoke-static {v0, v2, v1}, Lcom/eta/voicebridge/Config;->pick(Lde/robv/android/xposed/XSharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/eta/voicebridge/Config;->model:Ljava/lang/String;

    sget-object v1, Lcom/eta/voicebridge/Config;->lang:Ljava/lang/String;

    const-string v2, "lang"

    invoke-static {v0, v2, v1}, Lcom/eta/voicebridge/Config;->pick(Lde/robv/android/xposed/XSharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/eta/voicebridge/Config;->lang:Ljava/lang/String;

    const-string v0, "VoiceBridge/Config"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "loaded provider="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/eta/voicebridge/Config;->provider:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " lang="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/eta/voicebridge/Config;->lang:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/eta/voicebridge/L;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    const-string v1, "VoiceBridge/Config"

    const-string v2, "config reload failed, keeping current"

    invoke-static {v1, v2, v0}, Lcom/eta/voicebridge/L;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
