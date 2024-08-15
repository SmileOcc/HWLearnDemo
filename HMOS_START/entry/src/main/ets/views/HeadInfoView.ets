
@Component
export default struct HeadInfoView {

  @Link updateTaskDate:String
  @Link progressStr:String

  build() {
    Column() {
      Row(){
        Image($r('app.media.app_icon'))
          .width(120)
          .height(120)
          .objectFit(ImageFit.Contain)
          .backgroundColor(Color.Green)

        Column({space:8}){
          Text("项目目标开始任务")
            .fontColor(Color.Red)
            .fontSize(24)
          Text("项目描述")
            .fontSize(18)
            .fontColor(Color.Yellow)
        }
        .alignItems(HorizontalAlign.Start)
      }
      Row(){
        Column(){
          Text('任务进度')
            .fontColor(Color.Red)
            .fontSize(24)
            .textAlign(TextAlign.Start)
          Text("更新日期  "+this.updateTaskDate)
            .fontColor(Color.Yellow)
            .fontSize(16)
            .textAlign(TextAlign.Start)
            .textOverflow({overflow:TextOverflow.Ellipsis})
        }
        .width('70%')
        .alignItems(HorizontalAlign.Start)


        Stack(){
          Progress({ value: 25, total: 100, type: ProgressType.Ring })
            .width(64)
            .height(64)
            .backgroundColor(Color.Gray)
            .onClick(()=>{
              this.progressStr = "2/3"
              console.log(this.progressStr + "aaa")
            })
            .width(64)
            .height(64)
          Text("" + this.progressStr??"0/3")
        }.width(64).height(64).alignContent(Alignment.Center)
      }
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.SpaceBetween)
      .height(64)
      .backgroundColor(Color.Blue)
      .width('100%')
    }
    .width('100%')
    .backgroundColor(Color.Green)
    .alignItems(HorizontalAlign.Start)
    .justifyContent(FlexAlign.Start)
  }
}