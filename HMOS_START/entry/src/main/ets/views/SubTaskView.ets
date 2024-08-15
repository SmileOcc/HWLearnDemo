
@Component
export default struct SubTaskView{

  @Prop taskList:String[] = ["1","2"]

  @Builder
  taskItem(title: String) {
    Row(){
      Text("任务:"+title)
        .fontColor(Color.Black)
        .fontSize(18)
        .fontStyle(FontStyle.Italic)
      Blank()
      Text("开始日期")
    }
    .padding(8)
    .width('100%')
    .height('80vp')
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.SpaceBetween)
  }

  build() {
      Column({space:8}) {

        this.taskItem("a")
        this.taskItem("b")
        // this.taskItem("c")
        // this.taskItem("e")


        ForEach(
          this.taskList,
          //默认item是any类型的，所以想要获取item属性值提示，可以给item设置类型Item
          (item : String) => {
            this.taskItem(item)

          }
        )

      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
      .backgroundColor(Color.Orange)
    .borderRadius(16)
    .clip(true)


  }
}