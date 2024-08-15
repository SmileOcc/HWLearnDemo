import router from '@ohos.router'

import { HMContentHeader } from '../view/HMContentHeader';
import { HMInputView } from '../view/HMInputView';
import display from '@ohos.display';
import { HMItemInfo, HMHistoryInfo } from '../model/HMItemInfo';
import  { KSManager } from '../entryability/EntryAbility'
import { BusinessError } from '@kit.BasicServicesKit';

//随机色
const randomColor = Math.floor(Math.random()*16777215).toString(16)
@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State headerInputTextNumber:string = '0'

  resultNumber: number = 0
  currentFloat:number|string = ''

  operateWay:string = ''
  private screenHeight = px2vp(display.getDefaultDisplaySync().height);
  private screenWidth = px2vp(display.getDefaultDisplaySync().width) ;

  @State @Watch('inputChange') inputInfo:HMItemInfo = new HMItemInfo()

  currentOperateDesc:string = ''

  historyList:Array<HMHistoryInfo> = []

  aboutToAppear(): void {
    console.log(`====== w:${this.screenWidth}  h:${this.screenHeight}`)

    //KSManager.putData("ksKey_name","{\"msg\":\"success\",\"code\":200}")

    KSManager.getData<string>("kHistory_record").then((value)=> {
      console.debug(`===== ${value}`)
      this.historyList = JSON.parse(value)
      console.log(`===== ${JSON.stringify(this.historyList)}`)

    }).catch((err:BusinessError)=> {

    })
    //
    // setTimeout(() => {
    //   KSManager.getData<string>("ksKey_name").then((value)=> {
    //     console.debug(`===== ${value}`)
    //
    //   }).catch((err:BusinessError)=> {
    //
    //   })
    //
    //
    // }, 3000)
  }

  //只处理 + - x ÷
  inputChange() {
    if (this.inputInfo.isOperate) {
      let tempOperate = this.inputInfo.title

      let oldOperateWay = this.operateWay

      console.log(`=============输入：${this.inputInfo.title}  old:${this.operateWay}`)

      if (tempOperate == oldOperateWay || (oldOperateWay == '' && tempOperate == '=')) {
        console.log(`=======连续计算操作符输入 0 :${tempOperate}`)
        return;
      }

      if (this.inputInfo.title == 'AC') {
        this.currentFloat = ''
        this.resultNumber = 0
        this.operateWay = ''
        this.headerInputTextNumber = this.resultNumber + ''
        return;
      }
      if (tempOperate == '+/-' || tempOperate == '%') {
        console.log('=============无效输入')
        AlertDialog.show({message:"未实现"})
        return;
      }
      if (this.headerInputTextNumber == '0' && tempOperate == '-') {
        this.currentFloat = '-'
        this.headerInputTextNumber = this.currentFloat + ''
        return;
      }

      let tmpstr = this.currentFloat + ''
      let inputNumber = parseFloat(tmpstr)

      if (inputNumber == 0 && oldOperateWay == '÷') {
        console.log(`=======无效输入:${this.inputInfo.title}`)
        return;
      }
      if (Number.isNaN(inputNumber)) {//转换数字失败
        console.log(`=======连续计算操作符输入:${tempOperate}`)
        if (tempOperate != '=') {
          this.operateWay = this.inputInfo.title
        }
        return;
      }
      console.log(`=======有效输入:${inputNumber} 旧：${this.resultNumber}`)


      oldOperateWay = this.operateWay
      console.log(`old : ${oldOperateWay}}`)

      if (oldOperateWay != '') {
        console.log(`==========开始计算 : ${oldOperateWay}`)
        if (this.currentOperateDesc == '') {
          this.currentOperateDesc = this.resultNumber + ''
        }

        if (oldOperateWay == '+') {
          this.resultNumber += inputNumber

          this.currentOperateDesc = this.currentOperateDesc + ' + ' + inputNumber

        } else  if (oldOperateWay == '-') {
          this.resultNumber -= inputNumber
          this.currentOperateDesc = this.currentOperateDesc + ' - ' + inputNumber

        } else if (oldOperateWay == 'x') {
          this.resultNumber = this.resultNumber * inputNumber
          this.currentOperateDesc = this.currentOperateDesc + ' x ' + inputNumber

        } else if (oldOperateWay == '÷') {
          this.resultNumber = this.resultNumber / inputNumber
          this.currentOperateDesc = this.currentOperateDesc + ' ÷ ' + inputNumber

        }
        this.headerInputTextNumber = this.resultNumber + ''

        this.resultNumber = parseFloat(this.headerInputTextNumber)
        this.currentFloat = ''

        this.operateWay = tempOperate

        if (tempOperate == '=') {
          this.operateWay = ''
          this.currentFloat = this.headerInputTextNumber

          this.currentOperateDesc = this.currentOperateDesc + ' = ' + this.headerInputTextNumber

          this.saveData()

        }
        //计算结果为0
        if (this.resultNumber == 0) {
          this.currentFloat = ''
        }

        console.log(`==========计算结果：curr:${this.currentFloat} 和：${this.resultNumber}`)

      } else {
        this.resultNumber = inputNumber
        this.currentFloat = ''
        this.operateWay = tempOperate
      }



    } else {

      let inputNumber = this.inputInfo.title

      if (this.resultNumber == 0 && inputNumber == '0') {
        return;
      }

      if (this.currentFloat == '' && inputNumber == '.') {
        this.currentFloat = '0.'

      } else if (this.resultNumber == 0 && inputNumber == '0') {
        if (this.currentFloat == '0.') {
          this.currentFloat = this.currentFloat + inputNumber
        } else  {
          this.currentFloat = '0'
        }

      } else if (this.currentFloat == '0' && inputNumber != '.') {
        console.log("=======无效输入")
        return

      }
      else {
        this.currentFloat = this.currentFloat + inputNumber
      }

      if (this.currentFloat == '') {
        this.headerInputTextNumber = '0'
      } else {
        this.headerInputTextNumber = this.currentFloat + ''
      }
      console.log(`====输入：${inputNumber}  end:${this.currentFloat}」 `)


    }
  }


  saveData() {

    let currentItemInfo:HMHistoryInfo = {
      title: this.headerInputTextNumber,
      desc:this.currentOperateDesc,
      date: 'date'
    }

    this.historyList.push(currentItemInfo)

    let jsonStr = JSON.stringify(this.historyList)

    KSManager.putData("kHistory_record",jsonStr)

    this.currentOperateDesc = ''

  }

  build() {
    Column() {
      this.navHeaderView()
      HMContentHeader({headerInputTextNumber:this.headerInputTextNumber})
        .height(150)
      HMInputView({inputInfo:$inputInfo})

    }
    .alignItems(HorizontalAlign.Start)
    .justifyContent(FlexAlign.SpaceAround)
    .width('100%')
    .height('100%')
  }

  @Builder
  SubMenu() {
    Menu() {
      MenuItem({ content: "记录"})
        .onClick(()=>{
          router.pushUrl({url:'pages/HistoryPage',params:this.historyList})
        })
      MenuItem({ content: "计算法", labelInfo: "未实现" })
    }
  }

  @Builder navHeaderView() {
    Row(){
      Text('记录')
        .fontColor(Color.Red)
        .onClick(()=>{
            //router.pushUrl({url:'pages/HistoryPage',params:this.historyList})
        })
        .bindMenu(this.SubMenu())
    }
    .justifyContent(FlexAlign.End)
    .height(56)
    .width('100%')
    .backgroundColor(Color.Blue)
    .opacity(0.5)

  }
}