
import display from '@ohos.display';
import { HMItemInfo } from '../model/HMItemInfo';
import { HWWaterFlowDataSource } from '../model/HWWaterFlowDataSource'

const randomColorss = Math.floor(Math.random()*16777215).toString(16)


@Component
export struct HMInputView {

  private screenHeight = px2vp(display.getDefaultDisplaySync().height);
  private screenWidth = px2vp(display.getDefaultDisplaySync().width) ;

  private itemSpace = 0.0
  private twidth = (this.screenWidth - 3 * this.itemSpace) / 4.0
  private theight = this.twidth


  eventBlock:((item:HMItemInfo)=>void)|undefined


  @Link inputInfo:HMItemInfo

  items: Array<string> = ['7','8', '9','4','5','6','1','2','3','0','.']
  allItems:Array<HMItemInfo>= []

  dataSource: HWWaterFlowDataSource | undefined

  aboutToAppear(): void {
    this.dataSource = new HWWaterFlowDataSource(this.twidth,this.theight,this.itemSpace)
  }
  // 保存flow item宽/高
  getItemSizeArray() {
    let twidth = (this.screenWidth - 5 * this.itemSpace) / 4.0
    let theight = twidth
    this.allItems = [
        {title:'AC',isOperate:true,width:twidth,height:theight},
        {title:'+/-',isOperate:true,width:twidth,height:theight},
        {title:'%',isOperate:true,width:twidth,height:theight},
        {title:'÷',isOperate:true,width:twidth,height:theight},

        {title:'7',isOperate:false,width:twidth,height:theight},
        {title:'8',isOperate:false,width:twidth,height:theight},
        {title:'9',isOperate:false,width:twidth,height:theight},
        {title:'x',isOperate:true,width:twidth,height:theight},

        {title:'4',isOperate:false,width:twidth,height:theight},
        {title:'5',isOperate:false,width:twidth,height:theight},
        {title:'6',isOperate:false,width:twidth,height:theight},
        {title:'-',isOperate:true,width:twidth,height:theight},

        {title:'1',isOperate:false,width:twidth,height:theight},
        {title:'2',isOperate:false,width:twidth,height:theight},
        {title:'3',isOperate:false,width:twidth,height:theight},
        {title:'+',isOperate:true,width:twidth,height:theight},

        {title:'0',isOperate:false,width:twidth,height:theight},
        {title:'.',isOperate:false,width:twidth * 2.0 + this.itemSpace,height:theight},
        {title:'=',isOperate:true,width:twidth,height:theight},
    ]
  }

  @Builder cellItem(item:HMItemInfo,index:number) {
    FlowItem() {
      //简单判断了
      // if (item.title === '0' && index == 16) {
      //   Button(item.title)
      //     .size({width:item.width,height:item.height})
      //
      // } else if (item.title === '0' && index == 17) {
      //   //只能点击一半，神奇，按道理都可以的，改左右组合吧
      //   Button(item.title)
      //     .operateButtonStyleRadiusR(item.width,item.height)
      //     .position({x:-item.width / 2.0,y:0})
      //     .borderRadius(item.height / 2.0)
      //     .backgroundColor(Color.Gray)
      // }

      if (item.title === '0' && index == 16) {
        Button(item.title)
          .operateButtonStyleRadiusR(item.width,item.height)
          // .size({width:item.width,height:item.height})
          // .position({x:item.width / 2.0,y:0})
          .borderRadius(item.height / 2.0)
          .backgroundColor(Color.Gray)

      } else if (item.title === '0' && index == 17) {
        //只能点击一半，神奇，按道理都可以的，改左右组合吧
        Button(item.title)
          .operateButtonStyleRadiusR(item.width,item.height)
          // .size({width:item.width,height:item.height})
          .position({x:-item.width / 2.0,y:0})
          .borderRadius(item.height / 2.0)
          .backgroundColor(Color.Gray)
      }
      else {
        if (item.isOperate) {
          Button(item.title,{type:ButtonType.Circle})
            .operateButtonStyle(item.width,item.height)
            .backgroundColor(Color.Orange)
        } else {
          Button(item.title,{type:ButtonType.Circle})
            .operateButtonStyle(item.width,item.height)
        }

      }

    }
    .onAppear(() => {

    })
    .onClick(()=> {
      console.log(`======click index ${item.title}`)
      this.inputInfo = item

      if (this.eventBlock != null) {
        this.eventBlock(item)
      }
    })
    .width(item.width)
    .height(item.height)
    .backgroundColor(Color.White)
    .clip(true)
  }

  build() {
    Column({space:0}) {
      WaterFlow() {
        LazyForEach(this.dataSource,(item:HMItemInfo,index:number) => {
          this.cellItem(item,index)
        },(item:string) => item)
      }
      .columnsTemplate("1fr 1fr 1fr 1fr")
      // .columnsGap(this.itemSpace)
      // .rowsGap(this.itemSpace)
      .columnsGap(this.itemSpace)
      .rowsGap(0.0)
      .enableScrollInteraction(false)
    }
    .height((this.theight + this.itemSpace) * 5.0 + 10.0)
    .backgroundColor(Color.Green)
  }






  ///================

  @Builder leftView() {
    Grid(){
      ForEach(this.items,(item:string) => {
        GridItem(){
          Button(item)
            .backgroundColor(Color.White)
        }.onClick(()=>{
          console.log(`======click index ${item}`)
        })
      })
    }
    .rowsTemplate('1fr 1fr 1fr')
    .columnsTemplate('1fr 1fr 1fr')
    .width('75%')
    .height('100%')
    .columnsGap(10)
    .rowsGap(10)
    .backgroundColor(Color.Green)


  }

  @Builder rightView() {
    Column(){

    }
    .width('25%')
    .height('100%')
    .backgroundColor(Color.Orange)
  }

}

//自定义按钮样式
@Extend(Button) function operateButtonStyle(w:number,h:number){
  .width(w)
  .height(h)
  .fontSize(18)
  .fontColor(Color.White)
  .backgroundColor(randomColorss)
  .borderRadius(w / 2.0)
}

//自定义按钮样式
@Extend(Button) function operateButtonStyleRadiusL(w:number,h:number){
  .width(w)
  .height(h)
  .fontSize(32)
  .fontWeight(FontWeight.Bold)
  .fontColor(Color.White)
  .backgroundColor(randomColorss)
  .borderRadius({topLeft:h/2.0,bottomLeft:h/2.0})
  .borderStyle(BorderStyle.Solid)
}


//自定义按钮样式
@Extend(Button) function operateButtonStyleRadiusR(w:number,h:number){
  .width(w)
  .height(h)
  .fontSize(32)
  .fontWeight(FontWeight.Bold)
  .fontColor(Color.White)
  .backgroundColor(randomColorss)
  .borderRadius({topRight:h/2.0,bottomRight:h/2.0})
}


function eventCall(arg0: () => undefined) {
  throw new Error('Function not implemented.');
}

