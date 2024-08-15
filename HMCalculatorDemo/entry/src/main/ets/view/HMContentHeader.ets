
@Component
export struct HMContentHeader {
  @Prop headerInputTextNumber:string = '0'

  build() {
    Column(){
      Text(this.headerInputTextNumber)
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)
        .textAlign(TextAlign.End)
    }
    .width('100%')
    .height('100%')
    .padding(10)
    .justifyContent(FlexAlign.End)
    .alignItems(HorizontalAlign.End)
    .backgroundColor(Color.Green)
  }
}