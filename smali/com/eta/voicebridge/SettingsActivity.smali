.class public final Lcom/eta/voicebridge/SettingsActivity;
.super Landroid/app/Activity;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private chkAuto:Landroid/widget/TextView;

.field private chkDoubao:Landroid/widget/TextView;

.field private chkEn:Landroid/widget/TextView;

.field private chkIflytek:Landroid/widget/TextView;

.field private chkOpenai:Landroid/widget/TextView;

.field private chkQwen:Landroid/widget/TextView;

.field private chkZh:Landroid/widget/TextView;

.field private etAppid:Landroid/widget/EditText;

.field private etKey:Landroid/widget/EditText;

.field private etModel:Landroid/widget/EditText;

.field private etSecret:Landroid/widget/EditText;

.field private etUrl:Landroid/widget/EditText;

.field private rowAppid:Landroid/view/View;

.field private rowModel:Landroid/view/View;

.field private rowSecret:Landroid/view/View;

.field private rowUrl:Landroid/view/View;

.field private selLang:Ljava/lang/String;

.field private selProvider:Ljava/lang/String;

.field private tvStatus:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const-string v0, "doubao"

    iput-object v0, p0, Lcom/eta/voicebridge/SettingsActivity;->selProvider:Ljava/lang/String;

    const-string v0, "zh"

    iput-object v0, p0, Lcom/eta/voicebridge/SettingsActivity;->selLang:Ljava/lang/String;

    return-void
.end method

.method private applyVisibility(Ljava/lang/String;)V
    .locals 4

    const-string v0, "iflytek"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/16 v1, 0x8

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/eta/voicebridge/SettingsActivity;->rowAppid:Landroid/view/View;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/16 v0, 0x8

    :goto_0
    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object v3, p0, Lcom/eta/voicebridge/SettingsActivity;->rowSecret:Landroid/view/View;

    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    const-string v0, "openai"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iget-object v3, p0, Lcom/eta/voicebridge/SettingsActivity;->rowUrl:Landroid/view/View;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    const/16 v0, 0x8

    :goto_1
    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    const-string v0, "qwen"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "openai"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    :cond_2
    iget-object p1, p0, Lcom/eta/voicebridge/SettingsActivity;->rowModel:Landroid/view/View;

    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_3
    iget-object p1, p0, Lcom/eta/voicebridge/SettingsActivity;->rowModel:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private load()V
    .locals 4

    const-string v0, "cfg"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/eta/voicebridge/SettingsActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "provider"

    const-string v2, "doubao"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/eta/voicebridge/SettingsActivity;->selProvider:Ljava/lang/String;

    const-string v1, "lang"

    const-string v2, "zh"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/eta/voicebridge/SettingsActivity;->selLang:Ljava/lang/String;

    iget-object v1, p0, Lcom/eta/voicebridge/SettingsActivity;->etKey:Landroid/widget/EditText;

    const-string v2, "key"

    const-string v3, ""

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/eta/voicebridge/SettingsActivity;->etSecret:Landroid/widget/EditText;

    const-string v2, "secret"

    const-string v3, ""

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/eta/voicebridge/SettingsActivity;->etAppid:Landroid/widget/EditText;

    const-string v2, "appid"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/eta/voicebridge/SettingsActivity;->etUrl:Landroid/widget/EditText;

    const-string v2, "url"

    const-string v3, "https://api.openai.com/v1"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/eta/voicebridge/SettingsActivity;->etModel:Landroid/widget/EditText;

    const-string v2, "model"

    const-string v3, ""

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/eta/voicebridge/SettingsActivity;->selProvider:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/eta/voicebridge/SettingsActivity;->applyVisibility(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/eta/voicebridge/SettingsActivity;->updateChecks()V

    invoke-direct {p0}, Lcom/eta/voicebridge/SettingsActivity;->status()V

    return-void
.end method

.method private nameOf(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const-string v0, "qwen"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "\u901a\u4e49\u5343\u95ee"

    return-object v0

    :cond_0
    const-string v0, "iflytek"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "\u8baf\u98de\u8bed\u97f3\u542c\u5199"

    return-object v0

    :cond_1
    const-string v0, "openai"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "OpenAI \u517c\u5bb9\u63a5\u53e3"

    return-object v0

    :cond_2
    const-string v0, "\u8c46\u5305\uff08\u706b\u5c71\u5f15\u64ce\uff09"

    return-object v0
.end method

.method private save()V
    .locals 5

    const-string v0, "cfg"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/eta/voicebridge/SettingsActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "provider"

    iget-object v2, p0, Lcom/eta/voicebridge/SettingsActivity;->selProvider:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v1, "lang"

    iget-object v2, p0, Lcom/eta/voicebridge/SettingsActivity;->selLang:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v1, "key"

    iget-object v2, p0, Lcom/eta/voicebridge/SettingsActivity;->etKey:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v1, "secret"

    iget-object v2, p0, Lcom/eta/voicebridge/SettingsActivity;->etSecret:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v1, "appid"

    iget-object v2, p0, Lcom/eta/voicebridge/SettingsActivity;->etAppid:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v1, "url"

    iget-object v2, p0, Lcom/eta/voicebridge/SettingsActivity;->etUrl:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v1, "model"

    iget-object v2, p0, Lcom/eta/voicebridge/SettingsActivity;->etModel:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.eta.voicebridge.CFG"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.google.android.inputmethod.latin"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/eta/voicebridge/SettingsActivity;->sendBroadcast(Landroid/content/Intent;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u5df2\u4fdd\u5b58\uff1a"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/eta/voicebridge/SettingsActivity;->selProvider:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/eta/voicebridge/SettingsActivity;->nameOf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\uff08\u4e0b\u6b21\u8bed\u97f3\u8f93\u5165\u751f\u6548\uff09"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    invoke-direct {p0}, Lcom/eta/voicebridge/SettingsActivity;->status()V

    return-void
.end method

.method private static setChk(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/16 v0, 0x8

    :goto_0
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private status()V
    .locals 3

    iget-object v0, p0, Lcom/eta/voicebridge/SettingsActivity;->tvStatus:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u5f53\u524d\u5f15\u64ce\uff1a"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/eta/voicebridge/SettingsActivity;->selProvider:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/eta/voicebridge/SettingsActivity;->nameOf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private updateChecks()V
    .locals 3

    iget-object v0, p0, Lcom/eta/voicebridge/SettingsActivity;->chkDoubao:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/eta/voicebridge/SettingsActivity;->selProvider:Ljava/lang/String;

    const-string v2, "doubao"

    invoke-static {v0, v2, v1}, Lcom/eta/voicebridge/SettingsActivity;->setChk(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/eta/voicebridge/SettingsActivity;->chkQwen:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/eta/voicebridge/SettingsActivity;->selProvider:Ljava/lang/String;

    const-string v2, "qwen"

    invoke-static {v0, v2, v1}, Lcom/eta/voicebridge/SettingsActivity;->setChk(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/eta/voicebridge/SettingsActivity;->chkIflytek:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/eta/voicebridge/SettingsActivity;->selProvider:Ljava/lang/String;

    const-string v2, "iflytek"

    invoke-static {v0, v2, v1}, Lcom/eta/voicebridge/SettingsActivity;->setChk(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/eta/voicebridge/SettingsActivity;->chkOpenai:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/eta/voicebridge/SettingsActivity;->selProvider:Ljava/lang/String;

    const-string v2, "openai"

    invoke-static {v0, v2, v1}, Lcom/eta/voicebridge/SettingsActivity;->setChk(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/eta/voicebridge/SettingsActivity;->chkZh:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/eta/voicebridge/SettingsActivity;->selLang:Ljava/lang/String;

    const-string v2, "zh"

    invoke-static {v0, v2, v1}, Lcom/eta/voicebridge/SettingsActivity;->setChk(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/eta/voicebridge/SettingsActivity;->chkEn:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/eta/voicebridge/SettingsActivity;->selLang:Ljava/lang/String;

    const-string v2, "en"

    invoke-static {v0, v2, v1}, Lcom/eta/voicebridge/SettingsActivity;->setChk(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/eta/voicebridge/SettingsActivity;->chkAuto:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/eta/voicebridge/SettingsActivity;->selLang:Ljava/lang/String;

    const-string v2, "auto"

    invoke-static {v0, v2, v1}, Lcom/eta/voicebridge/SettingsActivity;->setChk(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    sget v0, Lcom/eta/voicebridge/R;->btn_save:I

    if-ne p1, v0, :cond_0

    invoke-direct {p0}, Lcom/eta/voicebridge/SettingsActivity;->save()V

    return-void

    :cond_0
    sget v0, Lcom/eta/voicebridge/R;->row_doubao:I

    if-ne p1, v0, :cond_1

    const-string v0, "doubao"

    goto :goto_0

    :cond_1
    sget v0, Lcom/eta/voicebridge/R;->row_qwen:I

    if-ne p1, v0, :cond_2

    const-string v0, "qwen"

    goto :goto_0

    :cond_2
    sget v0, Lcom/eta/voicebridge/R;->row_iflytek:I

    if-ne p1, v0, :cond_3

    const-string v0, "iflytek"

    goto :goto_0

    :cond_3
    sget v0, Lcom/eta/voicebridge/R;->row_openai:I

    if-ne p1, v0, :cond_4

    const-string v0, "openai"

    :goto_0
    iput-object v0, p0, Lcom/eta/voicebridge/SettingsActivity;->selProvider:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/eta/voicebridge/SettingsActivity;->applyVisibility(Ljava/lang/String;)V

    goto :goto_2

    :cond_4
    sget v0, Lcom/eta/voicebridge/R;->row_zh:I

    if-ne p1, v0, :cond_5

    const-string v0, "zh"

    goto :goto_1

    :cond_5
    sget v0, Lcom/eta/voicebridge/R;->row_en:I

    if-ne p1, v0, :cond_6

    const-string v0, "en"

    goto :goto_1

    :cond_6
    sget v0, Lcom/eta/voicebridge/R;->row_auto:I

    if-ne p1, v0, :cond_7

    const-string v0, "auto"

    :goto_1
    iput-object v0, p0, Lcom/eta/voicebridge/SettingsActivity;->selLang:Ljava/lang/String;

    :goto_2
    invoke-direct {p0}, Lcom/eta/voicebridge/SettingsActivity;->updateChecks()V

    invoke-direct {p0}, Lcom/eta/voicebridge/SettingsActivity;->status()V

    :cond_7
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    sget p1, Lcom/eta/voicebridge/R;->activity_settings:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->setContentView(I)V

    sget p1, Lcom/eta/voicebridge/R;->et_key:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/eta/voicebridge/SettingsActivity;->etKey:Landroid/widget/EditText;

    sget p1, Lcom/eta/voicebridge/R;->et_secret:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/eta/voicebridge/SettingsActivity;->etSecret:Landroid/widget/EditText;

    sget p1, Lcom/eta/voicebridge/R;->et_appid:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/eta/voicebridge/SettingsActivity;->etAppid:Landroid/widget/EditText;

    sget p1, Lcom/eta/voicebridge/R;->et_url:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/eta/voicebridge/SettingsActivity;->etUrl:Landroid/widget/EditText;

    sget p1, Lcom/eta/voicebridge/R;->et_model:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/eta/voicebridge/SettingsActivity;->etModel:Landroid/widget/EditText;

    sget p1, Lcom/eta/voicebridge/R;->tv_status:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/eta/voicebridge/SettingsActivity;->tvStatus:Landroid/widget/TextView;

    sget p1, Lcom/eta/voicebridge/R;->row_appid:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/eta/voicebridge/SettingsActivity;->rowAppid:Landroid/view/View;

    sget p1, Lcom/eta/voicebridge/R;->row_secret:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/eta/voicebridge/SettingsActivity;->rowSecret:Landroid/view/View;

    sget p1, Lcom/eta/voicebridge/R;->row_url:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/eta/voicebridge/SettingsActivity;->rowUrl:Landroid/view/View;

    sget p1, Lcom/eta/voicebridge/R;->row_model:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/eta/voicebridge/SettingsActivity;->rowModel:Landroid/view/View;

    sget p1, Lcom/eta/voicebridge/R;->chk_doubao:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/eta/voicebridge/SettingsActivity;->chkDoubao:Landroid/widget/TextView;

    sget p1, Lcom/eta/voicebridge/R;->chk_qwen:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/eta/voicebridge/SettingsActivity;->chkQwen:Landroid/widget/TextView;

    sget p1, Lcom/eta/voicebridge/R;->chk_iflytek:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/eta/voicebridge/SettingsActivity;->chkIflytek:Landroid/widget/TextView;

    sget p1, Lcom/eta/voicebridge/R;->chk_openai:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/eta/voicebridge/SettingsActivity;->chkOpenai:Landroid/widget/TextView;

    sget p1, Lcom/eta/voicebridge/R;->chk_zh:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/eta/voicebridge/SettingsActivity;->chkZh:Landroid/widget/TextView;

    sget p1, Lcom/eta/voicebridge/R;->chk_en:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/eta/voicebridge/SettingsActivity;->chkEn:Landroid/widget/TextView;

    sget p1, Lcom/eta/voicebridge/R;->chk_auto:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/eta/voicebridge/SettingsActivity;->chkAuto:Landroid/widget/TextView;

    sget p1, Lcom/eta/voicebridge/R;->row_doubao:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    sget p1, Lcom/eta/voicebridge/R;->row_qwen:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    sget p1, Lcom/eta/voicebridge/R;->row_iflytek:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    sget p1, Lcom/eta/voicebridge/R;->row_openai:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    sget p1, Lcom/eta/voicebridge/R;->row_zh:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    sget p1, Lcom/eta/voicebridge/R;->row_en:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    sget p1, Lcom/eta/voicebridge/R;->row_auto:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    sget p1, Lcom/eta/voicebridge/R;->btn_save:I

    invoke-virtual {p0, p1}, Lcom/eta/voicebridge/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-direct {p0}, Lcom/eta/voicebridge/SettingsActivity;->load()V

    return-void
.end method
