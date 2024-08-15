
@Component
export struct HWAlertView {
  build() {
    Text("==HWAlertView===")
  }

  @Builder static CreateAlert(title:string, eventCall:()=>void|null) {
    Column(){
      Text("==HWAlertView===")
      Button("alertBtn")
        .onClick(eventCall)
    }
  }
}


@Builder export function CreateAlertMsgView(title:string, eventCall:()=>void|null) {
  Column(){
    Text("==HWAlertView===")
    Button("alertBtn")
      .onClick(eventCall)
  }
}