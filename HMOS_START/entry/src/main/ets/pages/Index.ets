import HeadInfoView from '../views/HeadInfoView';
import SubTaskView from '../views/SubTaskView';
import Logger from '../../ets/model/Logger'
import router from '@ohos.router'


import { ShareTipView,ShareResManager} from 'ShareHarLib'

@Entry
@Component
struct Index {
  @State updateTaskDate:String = "未开始"
  @State progressStr:String = "1/3"
  @State taskList:String[] = ["1","2"]


  @State positionX:Length = 0
  @State positionY:Length = 0

  aboutToAppear(): void {
    Logger.debug("aa")
  }

  build() {
    Stack({alignContent: Alignment.TopStart}){
      Scroll() {
        Column() {
          Text("工作目标")
            .fontSize(30)
            .fontWeight(FontWeight.Bold)

          HeadInfoView({updateTaskDate:this.updateTaskDate,progressStr:this.progressStr})
            .borderRadius(16)
            .borderStyle(BorderStyle.Solid)
            .borderWidth(1)
            .borderColor(Color.Red)
            .clip(true)

          Blank().height(10).backgroundColor(Color.White)
          SubTaskView({taskList:this.taskList})

          Button("新任务")
            .type(ButtonType.Capsule)
            .backgroundColor(Color.Blue)
            .fontSize(16)
            .fontColor(Color.Red)
            .width(120)
            .height(40)
            .onClick(()=>{
              this.taskList.push("add")
              this.updateTaskDate = "10010:11"
              this.progressStr = "3/3"
              console.log("====add task")


            }).position({ x: this.positionX, y: this.positionY })

          Button("share har module 页面")
            .id('accountBt')
            .margin(10)
            .fontSize(20)
            .fontColor(Color.Blue)
            .onClick(()=> {
              console.debug("======= share page")
              //'@bundle:包名（bundleName）/模块名（moduleName）/路径/页面所在的文件名(不加.ets后缀)'
              router.pushUrl({url:'@bundle:com.example.hmosstart/ShareHarLib/src/main/ets/pages/HWSuccessPage'})
            })

          ShareTipView()
          Text("nnnnnn")

        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .justifyContent(FlexAlign.Start)
        // .margin(12
        .padding(12)
      }
      .width('100%')
      .height('100%') //若没有外层Stack，不用设置这个
      .scrollable(ScrollDirection.Vertical)
      // .scrollBar(BarState.Auto)
      .scrollBarColor(Color.Red)
      .scrollBarWidth(10)



    }.width('100%').height('100%')

  }
}