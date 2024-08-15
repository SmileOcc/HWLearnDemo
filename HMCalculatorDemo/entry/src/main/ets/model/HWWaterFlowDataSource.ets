import { HMItemInfo } from './HMItemInfo';

export class  HWWaterFlowDataSource implements IDataSource {

  private dataArray: HMItemInfo[] = []
  private listeners: DataChangeListener[] = []


  constructor(twidth:number,theight:number,space:number) {
    this.dataArray = [
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
      //
      {title:'0',isOperate:false,width:twidth * 2.0 + space,height:theight},
      {title:'0',isOperate:false,width:twidth * 2.0 + space,height:theight},

      // {title:'0',isOperate:false,width:twidth,height:theight},
      // {title:'0',isOperate:false,width:twidth,height:theight},
      {title:'.',isOperate:false,width:twidth,height:theight},
      {title:'=',isOperate:true,width:twidth,height:theight},
    ]

  }

  totalCount(): number {
    return this.dataArray.length
  }

  getData(index: number): HMItemInfo {
    return this.dataArray[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener)
    }

  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener)
    if (pos >= 0) {
      this.listeners.splice(pos, 1)
    }
  }

}