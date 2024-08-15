import { router } from '@kit.ArkUI';

@Entry({routeName:'TestHarTwoPg'})
@Component
export struct TestHarTwoPage {
  @State message: string = 'TestHarTwoPage har';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('back')
          .onClick(()=>{
            router.back()
          })

        Button('local TestHarPage(这是路由名）ok')
          .onClick(()=>{
            router.pushNamedRoute({
              name:'TestHarPage'
            })
          })

        Button('local TestHarTwoPg(这是路由名）ok')
          .onClick(()=>{
            router.pushNamedRoute({
              name:'TestHarTwoPg'
            })
          })

        Button('local pushUrl 路径名 不行')
          .onClick(()=>{
            router.pushUrl({
              url:'../testhartwopage/TestHarThreePage'
            })

          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
