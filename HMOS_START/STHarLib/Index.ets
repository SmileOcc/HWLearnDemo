export { MainPage } from './src/main/ets/components/mainpage/MainPage'

export { HWAlertView, CreateAlertMsgView } from './src/main/ets/common/alertView/HWAlertView'
export { HWConstants, TEST_WIDTH, TEST_HEIGHT} from './src/main/ets/common/constant/HWConstants'


export { HWTTLogger }  from './src/main/ets/common/utils/HWTTLogger'

// export {hwLogger} from  './src/main/ets/common/utils/HWLogger'
//page 导出，同时页面要设置路由别名，用路由名跳转
export {TestHarPage} from  './src/main/ets/components/testharpage/TestHarPage'

export {TestHarTwoPage} from  './src/main/ets/components/testhartwopage/TestHarTwoPage'

//应该是下面这种 export default
// import getCurrentTime from './src/main/ets/common/utils/HWDateUtil'
// import HWLogger from './src/main/ets/common/utils/HWLogger'