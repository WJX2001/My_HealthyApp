import { CommonConstants } from '../../common/constants/CommonConstants'


@Component
export default struct ItemPanelHeader {
  build() {
    Row() {
      Text('2024年5月4日 早餐')
        .fontSize(18)
        .fontWeight(CommonConstants.FONT_WEIGHT_600)
      Image($r('app.media.ic_public_spinner'))
        .width(20)
        .fillColor(Color.Black)
    }

  }
}