import common from '@ohos.app.ability.common'
import UserPrivacyDialog from '../view/welcome/UserPrivacyDialog'
import PreferenceUtil from '../common/utils/PreferenceUtil'
import router from '@ohos.router'

@Extend(Text) function opacityWhiteText(opacity: number, fontSize: number = 10) {
  .fontSize(fontSize).opacity(opacity).fontColor(Color.White)
}

const PREF_KEY = 'userPrivacyKey'

@Entry
@Component
struct WelcomePage {
  context = getContext(this) as common.UIAbilityContext
  controller: CustomDialogController = new CustomDialogController({
    builder: UserPrivacyDialog({
      confirm: () => this.onConfirm(),
      cancel: () => this.exitApp()
    })
  })

  async aboutToAppear() {
    // 1.加载首选项
    let isAgree = await PreferenceUtil.getPreferenceValue(PREF_KEY, false)
    // 2.判断是否同意
    if (isAgree) {
      // 2.1 同意，跳转首页
      this.jumpToIndex()
    } else {
      // 2.2 不同意 弹框
      this.controller.open()
    }
  }

  // 跳转首页
  jumpToIndex() {
    setTimeout(() => {
      router.replaceUrl({
        url: 'pages/Index'
      })
    }, 1000)
  }

  onConfirm() {
    // 1.保存首选项
    PreferenceUtil.putPreferenceValue(PREF_KEY, true)
    // 2.跳转到首页
    this.jumpToIndex()
  }

  exitApp() {
    // 退出App
    this.context.terminateSelf()
  }

  build() {
    Column({ space: 10 }) {
      // 1. 中央Slogan
      Row() {
        Image($r('app.media.home_slogan'))
          .width(260)
      }.layoutWeight(1)
      // 2. logo
      Image($r('app.media.home_logo')).width(150)
      // 3. 文字描述
      Row() {
        Text('吉祥健康助手支持').opacityWhiteText(0.8, 12)
        Text('IPv6')
          .opacityWhiteText(0.8)
          .border({ style: BorderStyle.Solid, width: 1, color: Color.White, radius: 15 })
          .padding({ left: 5, right: 5 })
        Text('网络').opacityWhiteText(0.8, 12)
      }

      Text(`'减更多'指吉祥健康App希望通过软件工具的形式，帮助更多用户实现身材管理`)
        .opacityWhiteText(0.6)

      Text('浙ICP备0000000号-36D')
        .opacityWhiteText(0.4)
        .margin({ bottom: 35 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.welcome_page_background'))
  }
}