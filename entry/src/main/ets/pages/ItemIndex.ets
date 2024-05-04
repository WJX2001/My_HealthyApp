import router from '@ohos.router'
import { CommonConstants } from '../common/constants/CommonConstants'
import ItemCard from '../view/Item/ItemCard'
import ItemList from '../view/Item/ItemList'
import ItemPanelHeader from '../view/Item/ItemPanelHeader'

@Entry
@Component
struct ItemIndex {
  @State amount: number = 1
  @State showPanel: boolean = false

  onPanelShow() {
    this.showPanel = true
  }

  build() {
    Column() {
      // 1.头部导航
      this.Header()
      // 2.列表
      ItemList({ showPanel: this.onPanelShow.bind(this) })
        .layoutWeight(1)
      // 3.底部面板
      Panel(this.showPanel) {
        // 3.1 顶部日期
        ItemPanelHeader()
        // 3.2 记录项卡片
        ItemCard({ amount: this.amount })
        // 3.3 数字键盘

        // 3.4 按钮
      }
      .mode(PanelMode.Full)
      .dragBar(false)
      .backgroundMask($r('app.color.light_gray'))
      .backgroundColor(Color.White)

    }
    .width('100%')
    .height('100%')

  }

  @Builder Header() {
    Row() {
      Image($r('app.media.ic_public_back'))
        .width(30)
        .onClick(() => router.back())

      Blank()
      Text('早餐').fontSize(18).fontWeight(CommonConstants.FONT_WEIGHT_600)
    }
    .width(CommonConstants.THOUSANDTH_940)
    .height(32)
  }
}