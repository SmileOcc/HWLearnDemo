import { router } from '@kit.ArkUI';
import {TestHarTwoPage} from '../testhartwopage/TestHarTwoPage'

//没有设置路由名，
@Entry()
@Component
export struct TestHarThreePage {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('go other har Page')
          .onClick(()=>{
            router.pushNamedRoute({
              name:'TestHarPage'
            })

          })

        Button('go other har Page url')
          .onClick(()=>{
            router.pushUrl({
              url:'../testhartwopage/TestHarTwoPage'
            })

          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
