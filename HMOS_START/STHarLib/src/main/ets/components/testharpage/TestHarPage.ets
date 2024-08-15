import { router } from '@kit.ArkUI';

@Entry({routeName:'TestHarPage'})
@Component
export struct TestHarPage {
  @State message: string = 'TestHarPage Har';

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
      }
      .width('100%')
    }
    .height('100%')
  }
}
