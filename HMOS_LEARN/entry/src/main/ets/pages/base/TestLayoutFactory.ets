import Logger from '../../common/KLogger'

export interface TestLayoutFactory {
  testEvent():void
}

export class PhoneLayoutFactor implements TestLayoutFactory {
  testEvent(): void {
    Logger.debug('PhoneLayoutFactor')

  }
}

export class TabletLayoutFactor implements TestLayoutFactory {
  testEvent(): void {
    Logger.debug('TabletLayoutFactor')
  }

}