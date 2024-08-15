import { HMHistoryInfo } from '../model/HMItemInfo';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct HistoryPage {
  @State message: string = 'Hello World';

  historyList:Array<HMHistoryInfo> = []

  aboutToAppear(): void {
    let parr = router.getParams() as Array<HMHistoryInfo>
    this.historyList = parr
  }


  build() {
    List({space:12}){
      ForEach(this.historyList,(item:HMHistoryInfo)=> {
        ListItem() {
          Column(){
            Text(item.title).fontColor(Color.Blue).fontSize(24)
            Text(item.desc).fontColor(Color.Gray).fontSize(16)
          }
          .borderRadius(16)
          .padding(8)
          .backgroundColor(Color.Orange)
          .width('100%')
          .alignItems(HorizontalAlign.Start)
        }

      })
    }
    .padding(13)
    .width('100%')

  }
}